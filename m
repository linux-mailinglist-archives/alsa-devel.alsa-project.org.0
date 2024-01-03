Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF267823E89
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:24:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEF414CC;
	Thu,  4 Jan 2024 10:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEF414CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704360261;
	bh=xx/G39lJcQtRge5dpRsHbXbDNtB8jbJH83YA8jBJNt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJpqelWq9UMFyfOFORL+NcGd+F/8/oQ+y/Ja0Me+Mi310rnZTJgtT8w9ZasItul9f
	 knKWDfx/mLw4u6AzQacyGgK8vKeTj6N+neV+moIcoB5plLjkIew6sS2xtMG9eWDuFu
	 6KZXM4m+ofSEeCs44V5MOlF8iQ89mIrovBkNwQhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F546F8061C; Thu,  4 Jan 2024 10:22:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CCA5F80631;
	Thu,  4 Jan 2024 10:22:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6450F80537; Wed,  3 Jan 2024 15:47:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF06BF800B6
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 15:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF06BF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FjRaCZFC
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-28c5af37d3aso1861467a91.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jan 2024 06:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704293231; x=1704898031;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F7lfnd58ssxqxF2Vg08IC/kjE+bqXlt/zNwH+Z4RsAg=;
        b=FjRaCZFC/h9m3jjcKUhnEtb/a6xamKiOVlHwEu4b1Y1gM5GpATDRLdRU2pGr8s28/q
         Mtr5PdWWED5os4KHCMYJ2oj7iOvscxOf84D4RDnBmfu6Iv85JR458In4omVNmAypCLEG
         jBqxR9V4VK+8LlQrwtG7OyE9fT/N9FpyaiWXvFEsBbKlqc8/cOH/RacxWo23fRw2rylg
         AfGQdJBuhPq/NdTT63vgNLIxsO3WiC5oFNG5/iazJgK6qnb3MlyABCs5aUGF9qgcn4v0
         gmswpXvDleBz0LrGslic2aGYIQW3odaY8AM/E5B1tM080yJpB0QEvnYgTT1h/sAWbLZ2
         9UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293231; x=1704898031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7lfnd58ssxqxF2Vg08IC/kjE+bqXlt/zNwH+Z4RsAg=;
        b=YQey+wLcwimBb2MYneW/i+FIuqSkdJY2ZKAFF+x77qDqMS9JNzCMzGVNbS3n4zuaGN
         6R+mCtuNWUpW547NnyPrvvdRM1+Un0hsTKe6/GhzaIh/lhn2FmnycEAbaxk7f59wyFYf
         w0GcYbVChGuzXBKa83XWQ8pxgOpLplHIldiaFYUhCR3NnZeYsQdy5iIZi/JCJLXSKexD
         oDBczS6jjJaege5WURIVWtIo2F9ahyJNCj5L2UvWh7gcNrXj/lzn4fGEIQmExzx6/7RJ
         8+OYdIYA3iFMEgYoBpA7mqVs6vd1nuXZUz5bYiltL4AnqiviHymqGEhBTP9EtMAp6goc
         MAYg==
X-Gm-Message-State: AOJu0YzNLJVsh7/e05krPOFBq9Hd+rfX058uDEFfDQ/CFRcjkTWWImX7
	GXq5vAb36gLmk1rutTAo9taCqetp8ldzby7PWUQ=
X-Google-Smtp-Source: 
 AGHT+IGNiULJjIIaAgN9r/bJJMLFv33w+YL5B7hJbYo63th4gizhO6im98kba+T6TrKwWcMn2PNxfae/g49gNC6HXIU=
X-Received: by 2002:a17:90a:8a89:b0:28b:cfa3:8f0e with SMTP id
 x9-20020a17090a8a8900b0028bcfa38f0emr28518664pjn.3.1704293231282; Wed, 03 Jan
 2024 06:47:11 -0800 (PST)
MIME-Version: 1.0
References: <NnE33wh--3-9@tutanota.com>
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
In-Reply-To: 
 <CAJX_Q+0NL1_dkLD2oePhW+EjvGiPLQ7S-1jarz4dANm12iHNMg@mail.gmail.com>
From: Matthew Anderson <ruinairas1992@gmail.com>
Date: Wed, 3 Jan 2024 08:47:02 -0600
Message-ID: 
 <CAEnG5GAsD_Db7G3TGkfA+bjO64V6tJuGph1dLOnvGhYicvLW_Q@mail.gmail.com>
Subject: Re: Fwd: No sound drivers on HP Envy x360 ey0xxx
To: tanure@linux.com
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
X-MailFrom: ruinairas1992@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5F2GQK3G2RZQVZFEWJXVK3X3CEL66DDZ
X-Message-ID-Hash: 5F2GQK3G2RZQVZFEWJXVK3X3CEL66DDZ
X-Mailman-Approved-At: Thu, 04 Jan 2024 09:22:39 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F2GQK3G2RZQVZFEWJXVK3X3CEL66DDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhlIGlzc3VlIGlzIHRoYXQgSFAgZG9lcyBub3QgcHJvdmlkZSB0aGUgRFNEIGluZm9ybWF0aW9u
IGluIHRoZSBCSU9TIGZvcg0KdGhlIENpcnJ1cyBBbXAuIEkndmUgYWxyZWFkeSBlbWFpbGVkIEhQ
IGluZm9ybWluZyB0aGVtIG9mIHRoZSBpc3N1ZS4gSSB0b28NCmhhdmUgYSBuZXdlciBIUCBFbnZ5
IFgzNjAgd2hpY2ggaGFzIHRoZSBzYW1lIHByb2JsZW0uDQoNCk9uIFdlZCwgSmFuIDMsIDIwMjQs
IDg6MjjigK9BTSBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+IHdyb3RlOg0KDQo+DQo+
DQo+IE9uIFdlZCwgMyBKYW4gMjAyNCwgMDg6MjMgLCA8dm9yZWNrLWx1a2FzQHR1dGFub3RhLmNv
bT4gd3JvdGU6DQo+DQo+PiBJIGhvcGUgSSdtIHJlc3BvbmRpbmcgY29ycmVjdGx5DQo+Pg0KPj4g
T24gYnVnemlsbGEgSSB3YXMgYXNrZWQgdG8gYXR0YWNoIGRtZXNnIGFuZCBsc3BjaSBvdXRwdXQu
IEknbSBzZW5kaW5nDQo+PiBib3RoIGFzIGF0dGFjaG1lbnRzIChjYXVzZSBvZiB0aGVpciBsZW5n
dGgpIGFuZCBob3BlIGl0IHdvcmtzLCBpdCdzIG15DQo+PiBmaXJzdCB0aW1lIHdvcmtpbmcgd2l0
aCB0aGVzZSBtYWlsaW5nIGxpc3RzLg0KPj4NCj4NCj4gSGksDQo+DQo+IFRoZSBtb3N0IGltcG9y
dGFudCB0aGluZyB0byBzdGFydCBpcyB0aGUgRFNEVCBkdW1wIGZyb20geW91ciBCaW9zLg0KPiBU
aGF0IHNob3VsZCBkZXNjcmliZSB0aGUga2V5IHBvaW50cyBhYm91dCB0aGUgaGFyZHdhcmUgY29u
ZmlndXJhdGlvbi4NCj4NCj4gVGhhbmtzDQo+IEx1Y2FzIFRhbnVyZQ0KPg0KPj4NCg==
