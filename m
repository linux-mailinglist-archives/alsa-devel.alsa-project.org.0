Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE9646B16F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 04:22:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697EB2274;
	Tue,  7 Dec 2021 04:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697EB2274
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638847328;
	bh=wfjA+oCReUJlJ3j6hK3CW5PFMqpM78UndiGyrR+VgAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXuzKO9Tg9CXvfzdJqIni1ffQwwhsfEeN2XPUQTevmCB57LDVuI6IEOY0K+eE3n7R
	 vVDdozi6IyrwlNXxodZ0BVlPZnslJFBnZ8S78WKHxK3Dk0ATOLx+RVDDh8zULl71Q3
	 KH+ynYjfv7yY6YYtWmtmBOxTowyiaY2lB844H84s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1379F80217;
	Tue,  7 Dec 2021 04:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BC0FF8028D; Tue,  7 Dec 2021 04:20:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D69CF80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 04:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D69CF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XedFAg0v"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QwKYbGsw"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CA995C021C;
 Mon,  6 Dec 2021 22:20:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 06 Dec 2021 22:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=COJgtQxbcEHsuKRODGvEtP2enfi
 iNLvOC6Ia22XOOyU=; b=XedFAg0vxFhiRpFZAavEyxcJtF+hrZfb2rOfOzKBg9b
 UguO7aNV9Olf70BaoFmcbs+eNNVErPa8VFxdzxvhLNOs9xWSpQ+fWMG8Z79gb1/D
 unJhE2h53n5Tmk4z2RgwX9FTicy/3EJgJ5yfaW9rympKjoWJjdIpqZe2dhtTetuS
 bC9s31AS7tsI6yJJz4U7bR99yUBKL1A24EuIh+8EQz7yIWKAJrIxDKD/k25M9jfJ
 X6z01KAv7cXjPXJ7RwgOHItczxlUwTlrZOiQWuSLhx6KfaFdalaYKftX+2lm97Fd
 f4JMPqOf+eekDemJbUgI/QVsWupeWWZxGV5CTOnSyNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=COJgtQ
 xbcEHsuKRODGvEtP2enfiiNLvOC6Ia22XOOyU=; b=QwKYbGswyrA3RgV4xryQ2W
 2KOZYSsWWJ/ZztX+0G8coCFcN/ZPbbF/URYtW12blglTmaoDXDcbKMtHDV4l0VNv
 J0H2vDUaSpe001Hb8WksIFCBB0hjArFOXD3STXPiXrtYOqARwipS3x+oeyo7laNI
 m2Rs11wlOIM8K4orpcGCel2BsZXru3BJUN9IAmqdAWvf0j1csd55J058c8BClBAA
 PRYFdNRfmhz8bIvaXmOsxEIJUIxUOA1HvyFasWXippGqWCpMwf6MKyT4/GpmPEtY
 YmR3ii31tK5BZx5mJTTEynZugnm8WMqAncJStrJzBZPlBdgzAyqoHxV2Src5yH+Q
 ==
X-ME-Sender: <xms:BNOuYUhHrscGmb2Kst92t28v1vCb2NYtUPsinI8YQZ4z3yWlSH8VRQ>
 <xme:BNOuYdAllQfMXWurkan99qFGjQxjuEUeyDzvrbmu4a-DJ-XTEfYcI1cOZLotcd5P1
 EaKlme2Qzj5BG4wFUk>
X-ME-Received: <xmr:BNOuYcFRmm11CHUAQJRrdHsm99Y6BS9uHnYbOuOeXy-TehED2WIWQiHqcS8HNEIGpIhCZXHyeiJBA-reN18byqzRbb6Y5oGLtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeeggdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnheplefhueegvdejgfejgfdukeefudetvddtuddtueeivedt
 tdegteejkedvfeegfefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:BNOuYVSh91CUkrmqlDM8bDIQmlY7HNq0EvjJBcvOKeceIJ_YSaFOwQ>
 <xmx:BNOuYRztFMJyM7GWicI8e1UWl6g57gfNn_VEUFYkY4j1jzMM7gismQ>
 <xmx:BNOuYT65ps7Ics_lPiUE5Vgz9zqB4X2ZPL4RzFjGlAHBLMQf3J0-cg>
 <xmx:BNOuYTvlME9IgazwMtKfy3Q3mCpakZnGlLZ2yTEG6iUTSSpImI5Dzg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Dec 2021 22:20:34 -0500 (EST)
Date: Tue, 7 Dec 2021 12:20:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
Message-ID: <Ya7TAHdMe9i41bsC@workstation>
Mail-Followup-To: Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Shuah Khan <shuah@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org
References: <20211206160305.194011-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206160305.194011-1-broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On Mon, Dec 06, 2021 at 04:03:05PM +0000, Mark Brown wrote:
> Add a basic test for the mixer control interface. For every control on
> every sound card in the system it checks that it can read and write the
> default value where the control supports that and for writeable controls
> attempts to write all valid values, restoring the default values after
> each test to minimise disruption for users.
> 
> There are quite a few areas for improvement - currently no coverage of the
> generation of notifications, several of the control types don't have any
> coverage for the values and we don't have any testing of error handling
> when we attempt to write out of range values - but this provides some basic
> coverage.
> 
> This is added as a kselftest since unlike other ALSA test programs it does
> not require either physical setup of the device or interactive monitoring
> by users and kselftest is one of the test suites that is frequently run by
> people doing general automated testing so should increase coverage. It is
> written in terms of alsa-lib since tinyalsa is not generally packaged for
> distributions which makes things harder for general users interested in
> kselftest as a whole but it will be a barrier to people with Android.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> 
> v2: Use pkg-config to get CFLAGS and LDLIBS for alsa-lib.
> 
>  MAINTAINERS                               |   7 +
>  tools/testing/selftests/Makefile          |   3 +-
>  tools/testing/selftests/alsa/.gitignore   |   1 +
>  tools/testing/selftests/alsa/Makefile     |   9 +
>  tools/testing/selftests/alsa/mixer-test.c | 616 ++++++++++++++++++++++
>  5 files changed, 635 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/alsa/.gitignore
>  create mode 100644 tools/testing/selftests/alsa/Makefile
>  create mode 100644 tools/testing/selftests/alsa/mixer-test.c

I think it safer to take care of volatile attribute when comparing read
value to written value. I'm glad if you review below patch.

As another topic, the runtime of alsa-lib application largely differs
between process user due to the result of parsing text files for
configuration space. I can easily imagine that developers unfamiliar to
alsa-lib carelessly adds invalid or inadequate configurations to files
under target path of alsa-lib configuration space, and they are puzzled
since they are unaware of the fact that the kselftest is affected by
userspace stuffs for the runtime.

If we respect the basic theory of test (idempotence), we can use ioctl(2)
with requests for ALSA control interface since it's not so complicated
(at least it is easier than ALSA PCM interface). The purpose of
kselftest is to test kernel stuffs, not to test userspace stuffs
including alsa-lib implementation and variety of plugins.

======== 8< --------

From 0052f48a931d93b993e406ffaf4c8fbecac15e84 Mon Sep 17 00:00:00 2001
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Date: Tue, 7 Dec 2021 11:43:56 +0900
Subject: [PATCH] kselftest: alsa: optimization for
 SNDRV_CTL_ELEM_ACCESS_VOLATILE

The volatile attribute of control element means that the hardware can
voluntarily change the state of control element independent of any
operation by software. ALSA control core necessarily sends notification
to userspace subscribers for any change from userspace application, while
it doesn't for the hardware's voluntary change.

This commit adds optimization for the attribute. Even if read value is
different from written value, the test reports success as long as the
target control element has the attribute. On the other hand, the
difference is itself reported for developers' convenience.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 tools/testing/selftests/alsa/mixer-test.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index 6082efa0b426..b87475fb7372 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -317,9 +317,13 @@ bool show_mismatch(struct ctl_data *ctl, int index,
 	}
 
 	if (expected_int != read_int) {
-		ksft_print_msg("%s.%d expected %lld but read %lld\n",
-			       ctl->name, index, expected_int, read_int);
-		return true;
+		// NOTE: The volatile attribute means that the hardware can voluntarily change the
+		// state of control element independent of any operation by software.
+		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
+
+		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
+			       ctl->name, index, expected_int, read_int, is_volatile);
+		return !is_volatile;
 	} else {
 		return false;
 	}
-- 
2.32.0

======== 8< --------


Cheers

Takashi Sakamoto
