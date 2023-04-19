Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4266E722D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 06:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4048FEAE;
	Wed, 19 Apr 2023 06:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4048FEAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681877982;
	bh=LV0yzalVx4e62c+vQ4sHmUZS8TGcIGamldw0Zmyrm1I=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jhqPUjEZyOKPwWXHkbKjUIw3aUHx3BI0Ea2ZgZQW8qMSShRVBrxx1k+rLjW4nUOSP
	 1u9VwPVkodFU55gyJRIvzNyeFXDl5G/Tkfyw7SqfdZIqlrL41NW5gRromfDEjf0YjB
	 pTcllNdtShvt4y98VUNzHF5ihHTfEWAZ/M7XuA0g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2FEBF80149;
	Wed, 19 Apr 2023 06:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EB31F8019B; Wed, 19 Apr 2023 06:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93EA2F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 06:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EA2F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=F2JBkCZI
Received: by mail-wm1-x32f.google.com with SMTP id v3so3409380wml.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 21:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877921; x=1684469921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhNca8YLmfca4Op7ES/LC9OWSpn6i+BIs8xcyZhd0eI=;
        b=F2JBkCZIs+H541AoHGtbcEpZwCWyCLC5pcvrUZD7G8K5NIdPR2fhKkcGxiCfLkHVKj
         +1jjBLG95RaPKhQjYh76hDjDgjV2Sxw2oUgHO63w1rgADNk3p0cbnsjzuJBYwxqMz7G/
         dpKtUq882jPGF/XDAUq+hygUTOeyadsh2tKHpx8WJ70INKaDkS03qK2Ag5M2xELaDzvG
         b0M9NioWL9Q+wttOkEVRkDKhlwahckP6r3gfxba+aH7EFwbnS+CeR6Q+jvHyClYEZQYJ
         NFWoT75p9FX04GFjxp86nM2yn4Pi4LvIo1R6FAnQfW4++MJtmzqV9CBlcN3bYLd2r+xj
         7eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877921; x=1684469921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhNca8YLmfca4Op7ES/LC9OWSpn6i+BIs8xcyZhd0eI=;
        b=cWGAmjaJjTMKiIMBmu/HWDIqcspaeerGchjEfa75BEqhvF4+w/3TrAhsNZwDED9Ysy
         xFmdBCjVym7Rz08o0VHQNSQUbNFBtBKyiT3fBAIUbm21OWrCcJe8bMQOR7pezCBVsoBv
         1CxoJJNaNpCes1Ul8Euz/nkuMfGThTlMMyI/3UR8CHD+yMuBy1seTxRwWPIGzSC6HcJV
         LkxGEwn5o9UYpiA9x425BvPK1gZu0iKrQfHkrDFYLTD1ZBMWblanY6YexHPgLLOaC1hq
         mqizqKGtjcB8n3C/rktUZ7g/mk0Bp03mM3SwiaYbHg0FOqKiYRBqaBFkFhL5SxC9DnN0
         bFdA==
X-Gm-Message-State: AAQBX9cDO2Mo+icTT2fEEmEdnWec87MfW5TfYQMCCMUdUrTusnDU1Fom
	iZPVCouAC3o/AcIybA7cPA/dbXiY1RlleoqaLzQ=
X-Google-Smtp-Source: 
 AKy350YPlDNKOyx3BzgeJ9alViRGYwy/nxa9GJyIszMj+/Nd1dPOqRE4u8E6pnhtp/PAKQaL9dgjBL3qZAVkW0Z9AKg=
X-Received: by 2002:a05:600c:3792:b0:3f1:6fef:703e with SMTP id
 o18-20020a05600c379200b003f16fef703emr2124489wmr.7.1681877920550; Tue, 18 Apr
 2023 21:18:40 -0700 (PDT)
MIME-Version: 1.0
References: 
 <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: 
 <c167c16a535049d56f817bbede9c9f6f0a0f4c68.1681626553.git.christophe.jaillet@wanadoo.fr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:18:29 +0800
Message-ID: 
 <CAA+D8AMRpObs+waOftBxHLrtmH97_=E7-bUtu6B77ZL5BZ+BfQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Simplify an error message
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID-Hash: JHP5Y3PHYOPD6CSTMUCE3Z2C37ICRRVL
X-Message-ID-Hash: JHP5Y3PHYOPD6CSTMUCE3Z2C37ICRRVL
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHP5Y3PHYOPD6CSTMUCE3Z2C37ICRRVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gU3VuLCBBcHIgMTYsIDIwMjMgYXQgMjoyOeKAr1BNIENocmlzdG9waGUgSkFJTExFVCA8DQpj
aHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6DQoNCj4gZGV2X2Vycl9wcm9iZSgp
IGFscmVhZHkgZGlzcGxheSB0aGUgZXJyb3IgY29kZS4gVGhlcmUgaXMgbm8gbmVlZCB0bw0KPiBk
dXBsaWNhdGUgaXQgZXhwbGljaXRseSBpbiB0aGUgZXJyb3IgbWVzc2FnZS4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5m
cj4NCj4NCg0KQWNrZWQtYnk6IFNoZW5naml1IFdhbmcgPHNoZW5naml1LndhbmdAZ21haWwuY29t
Pg0KDQpCZXN0IHJlZ2FyZHMNCndhbmcgc2hlbmdqaXUNCg0KPiAtLS0NCj4gIHNvdW5kL3NvYy9m
c2wvZnNsLWFzb2MtY2FyZC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbC1h
c29jLWNhcmQuYyBiL3NvdW5kL3NvYy9mc2wvZnNsLWFzb2MtY2FyZC5jDQo+IGluZGV4IGJmZmEx
MDQ4ZDMxZS4uNDA4NzA2NjhlZTI0IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvZnNsL2ZzbC1h
c29jLWNhcmQuYw0KPiArKysgYi9zb3VuZC9zb2MvZnNsL2ZzbC1hc29jLWNhcmQuYw0KPiBAQCAt
ODU4LDcgKzg1OCw3IEBAIHN0YXRpYyBpbnQgZnNsX2Fzb2NfY2FyZF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPg0KPiAgICAgICAgIHJldCA9IGRldm1fc25kX3NvY19y
ZWdpc3Rlcl9jYXJkKCZwZGV2LT5kZXYsICZwcml2LT5jYXJkKTsNCj4gICAgICAgICBpZiAocmV0
KSB7DQo+IC0gICAgICAgICAgICAgICBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgInNu
ZF9zb2NfcmVnaXN0ZXJfY2FyZA0KPiBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KPiArICAgICAgICAg
ICAgICAgZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJzbmRfc29jX3JlZ2lzdGVyX2Nh
cmQNCj4gZmFpbGVkXG4iKTsNCj4gICAgICAgICAgICAgICAgIGdvdG8gYXNyY19mYWlsOw0KPiAg
ICAgICAgIH0NCj4NCj4gLS0NCj4gMi4zNC4xDQo+DQo+DQo=
