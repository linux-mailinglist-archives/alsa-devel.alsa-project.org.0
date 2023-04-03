Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4B6D5381
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 23:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2BE1FC;
	Mon,  3 Apr 2023 23:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2BE1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680557475;
	bh=eNynELlmi9K/Xa1Al/juEPP4hznkSovgQhNjERaTYZ0=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=taV+p2c2HDOotbbdVeDsbKijelm9glliAiZXh9bpstlUimi91LJAT4kQ/kYaBK+is
	 NoSYuXoHPiWM3crw7b0ILYcoGjUOEqiIl/PwU2IYDgSGNoDbaHdIyfhj5KPvK9trJJ
	 SK8ALI+OJBTk6rKAdHvUvuUNk/3yO4TFO9cAYAes=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C71F80249;
	Mon,  3 Apr 2023 23:30:24 +0200 (CEST)
Date: Mon, 3 Apr 2023 17:30:02 -0400
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] kselftest/alsa: Increase kselftest timeout
References: <20221214130353.1989075-1-nfraprado@collabora.com>
 <808f35bf-2800-c34b-cae9-4d8eaa11294d@linuxfoundation.org>
 <Y5oSui0udT/6cvSI@sirena.org.uk>
In-Reply-To: <Y5oSui0udT/6cvSI@sirena.org.uk>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYJA4OLOP724UGK3C6U6EJGGV6HJLNUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168055742413.26.9347232686896575861@mailman-core.alsa-project.org>
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65CBAF8024C; Mon,  3 Apr 2023 23:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81356F8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 23:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81356F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=QYfo0Hac
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E804660036F;
	Mon,  3 Apr 2023 22:30:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680557407;
	bh=89fICjanYXC+xkrZxmZS2SkgJF0T/OuXjRoo3D52r70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYfo0HacUNTAtvjNKvvgPFM4llq9UPVLoC540U+x2JV+MUhDD8RfP/E1XGMiercQZ
	 xY5/E99mJPx55y1H98dCJxXIAUlGWn6mE/yRmzE+BGCYtcGz1O46MCOAz0aRBSp2O4
	 REx73GOg533mbBeARwDIvdroan/RC5cUiZ1qK/4k1RuJEZiNc4yBhSU3Kkt/0QK/0n
	 636hTgTrMzL6olfi8tKkX/sPaxohFxeoeucI6EhibeiEpdLDNHvJxKeI7IJGGGazgC
	 d0KOWznFvkTaO8b2V4uY4Pevxko+oNUUwfa6i5GN76MKkHLPlzOPtkWlyDoS1S49U6
	 WQtWTcx8o4CgA==
Date: Mon, 3 Apr 2023 17:30:02 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] kselftest/alsa: Increase kselftest timeout
Message-ID: <5302e70d-cb58-4e70-b44f-ff81b138a2e1@notapiano>
References: <20221214130353.1989075-1-nfraprado@collabora.com>
 <808f35bf-2800-c34b-cae9-4d8eaa11294d@linuxfoundation.org>
 <Y5oSui0udT/6cvSI@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5oSui0udT/6cvSI@sirena.org.uk>
Message-ID-Hash: QYJA4OLOP724UGK3C6U6EJGGV6HJLNUD
X-Message-ID-Hash: QYJA4OLOP724UGK3C6U6EJGGV6HJLNUD
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 Shuah Khan <shuah@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYJA4OLOP724UGK3C6U6EJGGV6HJLNUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 14, 2022 at 06:15:22PM +0000, Mark Brown wrote:
> On Wed, Dec 14, 2022 at 09:40:02AM -0700, Shuah Khan wrote:
> > On 12/14/22 06:03, Nícolas F. R. A. Prado wrote:
> 
> > > The default timeout for kselftests is 45 seconds, but that isn't enough
> > > time to run pcm-test when there are many PCMs on the device, nor for
> > > mixer-test when slower control buses and fancier CODECs are present.
> > > 
> > > As data points, running pcm-test on mt8192-asurada-spherion takes about
> > > 1m15s, and mixer-test on rk3399-gru-kevin takes about 2m.
> > > 
> > > Set the timeout to 4 minutes to allow both pcm-test and mixer-test to
> > > run to completion with some slack.
> 
> > What I have in mind is that the default run can be limited scope.
> > Run it on a few controllers and in the report mention that a full
> > test can be run as needed.
> 
> > There are a couple of examples of default vs. full test runs - cpu
> > and memory hot-lug tests.
> 
> For pcm-test it's probably more sensible to refactor things to run
> multiple PCMs (or at least cards, though that's less relevant in an
> embedded context) in parallel rather than cut down the test coverage,
> it's already very limited coverage as things stand.  There is some risk
> there could be false positives from cross talk between the PCMs but it's
> probably worth it.
> 
> With mixer-test if it's actually taking a long time to run generally
> this is just identifying that the driver could use some work,
> implementing runtime power management and a register cache will probably
> resolve most issues.

Hi Shuah and Mark,

sorry for the delay, but I'd still like to move forward with this.

Shuah, I've checked the tests you mentioned that have limited scope by default,
and we could do the same for the alsa kselftest, but I'm not sure I understand
how this solves the problem here. The fact is that the current timeout is too
short for a full run of the alsa kselftest on some machines, so we need to
increase the timeout in any case regardless of there being a limited scope run
by default or not. Mark implemented the parallelization he mentioned in the
meantime, but it doesn't help every hardware. The only other option I see is
reducing the time the PCM is tested for (currently 4 seconds). But I assume that
number was chosen for a reason.

I'd also like to better understand why we have an arbitrary (45 seconds) default
timeout. If there are users who want to limit the test duration to an arbitrary
time even if that means not getting full test coverage, shouldn't such arbitrary
time be supplied by the users themselves?

And is there any guidance on what are the acceptable exceptions to having a
longer timeout? Because there seem to be many kselftests which override the
default timeout with a longer one, even ones that disable it altogether.

I can see the value of having a timeout as the worst case scenario of how long
the test takes to run, to avoid hanging indefinitely, which is what the tests
with overriden timeout setting do. For the alsa kselftests that's
hardware-dependent (number of kcontrols for mixer-test; and number of PCMs and
working configurations for pcm-test), so we'd either need to guess a high enough
value for the timeout that all known hardware fits, or allow the timeout to be
set dynamically during runtime.

Thanks,
Nícolas
