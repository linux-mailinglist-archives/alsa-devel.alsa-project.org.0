Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA728230E0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 16:57:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58770E7A;
	Wed,  3 Jan 2024 16:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58770E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704297425;
	bh=Gua8BQpnwayiWOGtCxRwS1CfY2Rt9+GY22yyc9hvHjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TCvR6itkRrNaYU5KkoGhdggprRlhqqK5BcjnwXYq/N+FtbMMUuZvX4fQB/uBveLgs
	 JDGbuNUNH5rQnKsSgs10BcYemdap4r9LoFC5B2C0DJkbc+uzlh1OdkB51wCxSCyAep
	 z1kl5IHxc8WQVhQpX2BmutiY1yY1bVUv2MWqLBVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73539F8057A; Wed,  3 Jan 2024 16:56:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74143F8057F;
	Wed,  3 Jan 2024 16:56:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E78F4F80537; Wed,  3 Jan 2024 16:56:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E442F80086
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 16:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E442F80086
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5e6c8b70766so89526147b3.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 07:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297380; x=1704902180;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn7VOtINC55lOTy/B7JuMDmVjDUI9C4FMEpnGvML3ew=;
        b=L7aIwfukMPGPFsjQP6s1ui3QNV2rQQCfH5jotZSbgAdEnKpcMmpXairH8lA94uSree
         +TVSScRpp+JSKc75uHh4fqn5c18z9veeXX/oie9bu0hLrgYI5Q0EwLckTmPLmP0IOpkl
         J7rMDuevUbAVraTjsoq+p/RqBPdMJJyIrs/waCemnKOwToJaqcSou16aeitp579DozBp
         6eN/6NHVVHEV+IsMqeG9AVuPsUYZJw0v9vRcYVrV7v/k7MiljbxReZrXTS9zcZpJDk3W
         AQM547k4gWNlSD19Z0+YaDGn3q7Bcg62IVOYVJwSiAWMqfoK1DtRpZDcMZZOcki+XMz8
         YjPA==
X-Gm-Message-State: AOJu0YxIUDBpjgp8boFDz0LHgTryfhZvMzSMT86cTdXnbY3XTPR0zKmY
	qsUmDGIrxmH1+Zf+AmEMcGks+vU/ifaqxXkZ
X-Google-Smtp-Source: 
 AGHT+IFHN1aAua0zRU9BUv+Ry6mtbEi/raegMu+9xNNNP8yPL5P8dY2W12P8S/8lrNcW1DWnxVmh3w==
X-Received: by 2002:a81:7c54:0:b0:5e6:ac24:da0d with SMTP id
 x81-20020a817c54000000b005e6ac24da0dmr9790806ywc.68.1704297380022;
        Wed, 03 Jan 2024 07:56:20 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id
 e13-20020a81c14d000000b005ef818813f8sm5820025ywl.15.2024.01.03.07.56.19
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 07:56:19 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dbdacafe012so6934008276.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 07:56:19 -0800 (PST)
X-Received: by 2002:a25:4ed7:0:b0:dbe:3d4b:234 with SMTP id
 c206-20020a254ed7000000b00dbe3d4b0234mr5180281ybb.44.1704297379333; Wed, 03
 Jan 2024 07:56:19 -0800 (PST)
MIME-Version: 1.0
References: <NnE33wh--3-9@tutanota.com>
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
 <CAEnG5GAsD_Db7G3TGkfA+bjO64V6tJuGph1dLOnvGhYicvLW_Q@mail.gmail.com>
In-Reply-To: 
 <CAEnG5GAsD_Db7G3TGkfA+bjO64V6tJuGph1dLOnvGhYicvLW_Q@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 3 Jan 2024 12:56:10 -0300
X-Gmail-Original-Message-ID: 
 <CAJX_Q+1OoXdBAv=tMFdD1-Kfg0sDdnDjbYDpU9g8YfOeECwukA@mail.gmail.com>
Message-ID: 
 <CAJX_Q+1OoXdBAv=tMFdD1-Kfg0sDdnDjbYDpU9g8YfOeECwukA@mail.gmail.com>
Subject: Re: Fwd: No sound drivers on HP Envy x360 ey0xxx
To: Matthew Anderson <ruinairas1992@gmail.com>
Cc: voreck-lukas@tutanota.com, Bagasdotme <bagasdotme@gmail.com>,
	Alsa Devel <alsa-devel@alsa-project.org>, Andy Chi <andy.chi@canonical.com>,
	David Rhodes <david.rhodes@cirrus.com>, Faenkhauser <faenkhauser@gmail.com>,
	James Schulman <james.schulman@cirrus.com>, Kailang <kailang@realtek.com>,
	L Guzenko <l.guzenko@web.de>, Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>, Luke <luke@ljones.dev>,
	Overloader <overloader@tutanota.com>,
 Patches <patches@opensource.cirrus.com>,
	Perex <perex@perex.cz>, Rf <rf@opensource.cirrus.com>,
	Sbinding <sbinding@opensource.cirrus.com>,
 Shenghao Ding <shenghao-ding@ti.com>,
	Tiwai <tiwai@suse.com>, Tsengalb99 <tsengalb99@gmail.com>,
	Vitalyr <vitalyr@opensource.cirrus.com>, Yangyuchi66 <yangyuchi66@gmail.com>
Message-ID-Hash: ZTYMPHVXN37VWIJ4UOZJ7KTV5HFYXJXR
X-Message-ID-Hash: ZTYMPHVXN37VWIJ4UOZJ7KTV5HFYXJXR
X-MailFrom: tanurelinux@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: tanure@linux.com
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTYMPHVXN37VWIJ4UOZJ7KTV5HFYXJXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gV2VkLCAzIEphbiAyMDI0LCAxMTo0NyBNYXR0aGV3IEFuZGVyc29uLCA8cnVpbmFpcmFzMTk5
MkBnbWFpbC5jb20+IHdyb3RlOg0KDQo+IFRoZSBpc3N1ZSBpcyB0aGF0IEhQIGRvZXMgbm90IHBy
b3ZpZGUgdGhlIERTRCBpbmZvcm1hdGlvbiBpbiB0aGUgQklPUyBmb3INCj4gdGhlIENpcnJ1cyBB
bXAuIEkndmUgYWxyZWFkeSBlbWFpbGVkIEhQIGluZm9ybWluZyB0aGVtIG9mIHRoZSBpc3N1ZS4g
SSB0b28NCj4gaGF2ZSBhIG5ld2VyIEhQIEVudnkgWDM2MCB3aGljaCBoYXMgdGhlIHNhbWUgcHJv
YmxlbS4NCj4NCj4gT24gV2VkLCBKYW4gMywgMjAyNCwgODoyOOKAr0FNIEx1Y2FzIFRhbnVyZSA8
dGFudXJlQGxpbnV4LmNvbT4gd3JvdGU6DQo+DQo+Pg0KPj4NCj4+IE9uIFdlZCwgMyBKYW4gMjAy
NCwgMDg6MjMgLCA8dm9yZWNrLWx1a2FzQHR1dGFub3RhLmNvbT4gd3JvdGU6DQo+Pg0KPj4+IEkg
aG9wZSBJJ20gcmVzcG9uZGluZyBjb3JyZWN0bHkNCj4+Pg0KPj4+IE9uIGJ1Z3ppbGxhIEkgd2Fz
IGFza2VkIHRvIGF0dGFjaCBkbWVzZyBhbmQgbHNwY2kgb3V0cHV0LiBJJ20gc2VuZGluZw0KPj4+
IGJvdGggYXMgYXR0YWNobWVudHMgKGNhdXNlIG9mIHRoZWlyIGxlbmd0aCkgYW5kIGhvcGUgaXQg
d29ya3MsIGl0J3MgbXkNCj4+PiBmaXJzdCB0aW1lIHdvcmtpbmcgd2l0aCB0aGVzZSBtYWlsaW5n
IGxpc3RzLg0KPj4+DQo+Pg0KPj4gSGksDQo+Pg0KPj4gVGhlIG1vc3QgaW1wb3J0YW50IHRoaW5n
IHRvIHN0YXJ0IGlzIHRoZSBEU0RUIGR1bXAgZnJvbSB5b3VyIEJpb3MuDQo+PiBUaGF0IHNob3Vs
ZCBkZXNjcmliZSB0aGUga2V5IHBvaW50cyBhYm91dCB0aGUgaGFyZHdhcmUgY29uZmlndXJhdGlv
bi4NCj4+DQo+PiBUaGFua3MNCj4+IEx1Y2FzIFRhbnVyZQ0KPj4NCj4NCkFyZSB5b3Ugc3VyZT8N
CkhvdyB0aGUgY2FuICBXaW5kb3dzIGRyaXZlciBiZSBsb2FkZWQgd2l0aG91dCB0aGF0Pw0KDQo+
DQo=
