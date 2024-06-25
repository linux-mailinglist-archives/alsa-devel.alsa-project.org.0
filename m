Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7B091695F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 15:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F6985D;
	Tue, 25 Jun 2024 15:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F6985D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719323444;
	bh=7cRZ7RSanbNqP4/UsuFatp5+Yyy3gQFuJtGygSMSx4Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWcOCM7ig1giY3qRGqGYTCDoe1Rmrc5v7krO5+JNbf/90OCxnSTeqUcTGWEOQadFQ
	 Cqtd6JCDVZctK2/JMshMugpvSXh6HqDvLdOSRmOU89hkeLbATYSkoNDri2ve/trjv/
	 3XOKls0Y+NWM5pBeWsz7zflwBGpujkBrlV3K4zJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC51F805AB; Tue, 25 Jun 2024 15:50:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F15EEF805AF;
	Tue, 25 Jun 2024 15:50:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 141D8F80154; Tue, 25 Jun 2024 15:38:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	TIME_LIMIT_EXCEEDED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 2BC7DF80154
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 15:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BC7DF80154
Received: from fedori.lan (91ec5716.dsl.pool.telekom.hu
 [::ffff:145.236.87.22])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000720C2.00000000667AC6E1.00006109;
 Tue, 25 Jun 2024 15:32:16 +0200
Message-ID: <c0a9e15e7926e098bdea97a7d31c32427e0910c9.camel@irl.hu>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable headset mic on IdeaPad
 330-17IKB 81DM
From: Gergo Koteles <soyer@irl.hu>
To: Rauty <rautyrauty@gmail.com>, alsa-devel@alsa-project.org,
  tiwai@suse.com
Cc: perex@perex.cz, kailang@realtek.com,
  sbinding@opensource.cirrus.com, luke@ljones.dev,
  shenghao-ding@ti.com, simont@opensource.cirrus.com,
  foss@athaariq.my.id, rf@opensource.cirrus.com, wzhd@ustc.edu,
  linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Jun 2024 15:32:16 +0200
In-Reply-To: 
 <CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
References: <20240615125457.167844-1-rauty@altlinux.org>
	 <2c9ba341bc95d4b9010bf5f8794c0d14b1c57dc9.camel@irl.hu>
	 <CAGpJQTHoBAixmxta2WuZfjHjiK9GXF=hkfPyV7PBD5rt9Z_0WA@mail.gmail.com>
	 <CAGpJQTGqxEkfp003QLsp-syUgzDFCmHSmNaoOaem0ZMVf7_=bg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
Message-ID-Hash: K6V4S3TINMXFH4W4AYHIDLTSAOVFEG4F
X-Message-ID-Hash: K6V4S3TINMXFH4W4AYHIDLTSAOVFEG4F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6V4S3TINMXFH4W4AYHIDLTSAOVFEG4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey Rauty,

On Mon, 2024-06-24 at 11:25 +0300, Rauty wrote:
> I haven't changed the patch yet, but it's already in the stable-queue:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/t=
ree/queue-5.10/alsa-hda-realtek-enable-headset-mic-on-ideapad-330-1.patch
> Do you still need changes from me?

I still think this breaks Duet 7 sound, because snd_hda_pick_fixup
function picks the PCI SSIDs before Codec SSIDs.
But maybe I missed something.

Takashi, what do you think?

Best regards,
Gergo Koteles

