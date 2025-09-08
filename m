Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6492EB4FAB8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C700360255;
	Tue,  9 Sep 2025 14:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C700360255
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757420250;
	bh=DzAfLw6ioEWpIKGDXdSWJiuIYg7unQ63sL0EFbUxunY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gUNZti5vyOkXFkC6+6vGm4LFw8i6iUAQXHccZQeeXtAy3WVLubbIclZ0bJ2CgSIsC
	 lgU61ycir8Eff284oN80fiafvgvS2P0WwrCeu2ZbXuCpHowEkWck5HWn2ZZJN7vYy8
	 f2BqwiDL9UI04JCWXci9W7fG8GpDwaxyUpmDrja0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C1DF805F8; Tue,  9 Sep 2025 14:16:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D34D4F805EA;
	Tue,  9 Sep 2025 14:16:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 675D6F80185; Mon,  8 Sep 2025 08:24:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B64F8014C
	for <alsa-devel@alsa-project.org>; Mon,  8 Sep 2025 08:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B64F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Y17i16PE
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5886MqhL3729044;
	Mon, 8 Sep 2025 01:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757312572;
	bh=kiSruyZ6dIgTNsTur0Rl9zLXhun4FWHa+aZ/mS2ubQY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Y17i16PEiKMSFGlBGHVIGXfAUcoiMSfYcg099slOmq1wIxo1S7Ev/p/7MrKKOIMOx
	 FG9XN1jkixRbuBdOjAMPf8FH508CE+QvUbuKwSR9DidpTsWS5xZpKGaWUc0UOWi/4F
	 fSGm1rqgVXTk2C/dVQM436XZj/f1tNmqWjxSXR04=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5886Mqe23563612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 01:22:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 01:22:51 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.055; Mon, 8 Sep 2025 01:22:51 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Yi, Ken" <k-yi@ti.com>, "Lo, Henry"
	<henry.lo@ti.com>,
        "Chen, Robin" <robinchen@ti.com>, "Ji, Jesse"
	<jesse-ji@ti.com>,
        "Wang, Will" <will-wang@ti.com>,
        "jim.shil@goertek.com"
	<jim.shil@goertek.com>,
        "toastcheng@google.com" <toastcheng@google.com>,
        "chinkaiting@google.com" <chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118,
 tas2x20, tas5825 support
Thread-Index: AQHcGXV+g3xOktIe00qAtAz2a1355LSBruqAgAJSFIyAAMMoAIAEAJrf
Date: Mon, 8 Sep 2025 06:22:51 +0000
Message-ID: <67fafc23d16d4790821321643a87385f@ti.com>
References: <20250830061459.24371-1-baojun.xu@ti.com>
 <993d7fe7-5206-45a9-acb6-0d610a3a2136@sirena.org.uk>
 <12aa63e694c94213aeb6b48959d02b45@ti.com>,<b70314db-357f-4c39-a9b4-088d8ebed2b0@sirena.org.uk>
In-Reply-To: <b70314db-357f-4c39-a9b4-088d8ebed2b0@sirena.org.uk>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.165.138]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S7K3WQ4KDXUMGUE2YY3TJBJMUGK4MKGT
X-Message-ID-Hash: S7K3WQ4KDXUMGUE2YY3TJBJMUGK4MKGT
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:16:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7K3WQ4KDXUMGUE2YY3TJBJMUGK4MKGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Broonie,

> ________________________________________
> From: Mark Brown <broonie@kernel.org>
> Sent: 05 September 2025 18:41
> To: Xu, Baojun
> Cc: tiwai@suse.de; andriy.shevchenko@linux.intel.com; 13916275206@139.com=
; alsa-devel@alsa-project.org; Ding, Shenghao; linux-sound@vger.kernel.org;=
 linux-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+d=
t@kernel.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo,=
 Henry; Chen, Robin; Ji, Jesse; Wang, Will; jim.shil@goertek.com; toastchen=
g@google.com; chinkaiting@google.com
> Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] ASoC: tas2781: Add tas2118, ta=
s2x20, tas5825 support
>=20
> On Fri, Sep 05, 2025 at 04:15:45AM +0000, Xu, Baojun wrote:
>=20
> > > This doesn't apply against current code, please check and resend.
>=20
> > Hi, do you mean I need a re-patch for the newest (next/linux-next.git) =
code?
> > Or need to create patches on tree broonie/linux.git?
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6=
.18
>=20
This patch is also relative (shares the same include/sound/tas5825-tlv.h)
with another commit on next/linux-next.git:
https://patch.msgid.link/20250810122358.1575-1-baojun.xu@ti.com (ALSA: hda:=
 Add TAS5825 support)
However, it was not merged into broonie/sound.git yet, should I wait for it=
?

Best Regards
Jim
