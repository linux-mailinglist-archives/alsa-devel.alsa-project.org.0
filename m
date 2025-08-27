Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA289B38A24
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Aug 2025 21:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C775660291;
	Wed, 27 Aug 2025 21:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C775660291
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756322397;
	bh=zDH6u+RWXXPp2FGKTHji8ygz+V6812kSW0oVZm2iqfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XwksWigLVPvZC05O2VZPVg8kDsCrlzXD9Lc4s0sjY1Dva0n3SA0e7vuAmExOgmCi+
	 6vdyHuLUC9+CGXPZEWoR+lfXaeDMvHtsa5E1nVbfVOpwrbE3JaTkwxCxqLh+1CrNwJ
	 pkuzN9TlEuWhU7jakHm8gYRxvzhmYc0/ItDXrAqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F86BF805D6; Wed, 27 Aug 2025 21:19:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FFAF8016E;
	Wed, 27 Aug 2025 21:19:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88240F80495; Wed, 27 Aug 2025 21:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 14FA5F80153
	for <alsa-devel@alsa-project.org>; Wed, 27 Aug 2025 21:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14FA5F80153
Received: from [192.168.2.4] (51b694d5.dsl.pool.telekom.hu
 [::ffff:81.182.148.213])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000088D3B.0000000068AF5A06.00235C4C;
 Wed, 27 Aug 2025 21:18:30 +0200
Message-ID: <6079552e9c2e62ef84c835cdf81d7d70d8987031.camel@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for
 calibration beginning with 1 instead of 0
From: Gergo Koteles <soyer@irl.hu>
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
  "tiwai@suse.de" <tiwai@suse.de>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
  "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  "13564923607@139.com" <13564923607@139.com>,
  "13916275206@139.com" <13916275206@139.com>,
  "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "Xu, Baojun" <baojun.xu@ti.com>,
  "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
  "Ji, Jesse" <jesse-ji@ti.com>
Date: Wed, 27 Aug 2025 21:18:29 +0200
In-Reply-To: <3917a54f72134949a4baadd706463fa7@ti.com>
References: <20250826094105.1325-1-shenghao-ding@ti.com>
	 <8187d109eb70f6d459df63f3507a0be79efd9aa9.camel@irl.hu>
	 <3917a54f72134949a4baadd706463fa7@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Message-ID-Hash: TMABN7T6YMYJJAOYIDUTEDAMITEINGFU
X-Message-ID-Hash: TMABN7T6YMYJJAOYIDUTEDAMITEINGFU
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMABN7T6YMYJJAOYIDUTEDAMITEINGFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Wed, 2025-08-27 at 14:15 +0000, Ding, Shenghao wrote:
> Long time no see. Thanks for pointing that=C2=A0out.
> I'm preparing a new patch to correct it.
>=20
>=20

Yeah, the amps worked well, so no need to write :)

Rolling distros are moving to kernel 6.16 soon, so I'm worried about
the speakers.

Can the amplifier protect the speaker even with completely wrong
calibration values?

Thanks,
Gergo
