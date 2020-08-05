Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A824423CE9E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 20:43:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A477A1665;
	Wed,  5 Aug 2020 20:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A477A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596652980;
	bh=w+cdwCnL86B9RmHA17eE16OHuUsZ4yhHaNAKzN2RtMA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OKYi4sjFmmTutl1DOyBlk79gJyRMqm9dq9+3BqU0fwgX2s6OPXhBCN+3tnItxBjPZ
	 BC83fHzUGIhuvPh1glb0pSlkh6TR3ZHL/le81wLOSf7B+WchDRdOPd3R55Aabsaeyg
	 BUW9Gv+aMtHYCuAHVOCi9mSi+MgwIY0WS+rX4L1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B65CF8023E;
	Wed,  5 Aug 2020 20:41:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4577EF80218; Wed,  5 Aug 2020 20:41:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=NICE_REPLY_A,PRX_BODYSUB_1,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 341CDF80112;
 Wed,  5 Aug 2020 20:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341CDF80112
IronPort-SDR: SocyYxcgBmM0BDhgA5A2VuVPJgYF6lD07NaINbn/Zl7zRY14bTxCPFmSTlyREdyWv5Eaq++EMM
 6tQ1iYlS+vUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="214151288"
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; d="scan'208";a="214151288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 11:41:00 -0700
IronPort-SDR: 5Q67CSiRtBhU56wPSd2hCb7TjnvIb+6b5C758al9OfV37G4afkWT3ZGgpmK8ljyWfyEsOdW1tH
 fXlC5kIhHOAQ==
X-IronPort-AV: E=Sophos;i="5.75,438,1589266800"; d="scan'208";a="276172367"
Received: from wrjordan-mobl.amr.corp.intel.com (HELO [10.209.100.115])
 ([10.209.100.115])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 11:40:59 -0700
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7afe3352-221f-127b-ec81-17f016c8914a@linux.intel.com>
Date: Wed, 5 Aug 2020 13:40:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 pulseaudio-discuss@lists.freedesktop.org
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

[Adding Mark, Takashi and Jaroslav in CC: to make sure they see this thread]

On 8/5/20 12:31 PM, Tom Yan wrote:
> Hi all,
> 
> I just wonder if it's a "no one cares" or a "no one was aware of it"
> issue (or maybe both?).

none of the above, see below

> When you change (integer) values (e.g. volume) of a mixer control, it
> usually (if not always) involves calling two functions/methods of a
> snd_kcontrol_new, which are get and put, in order to do relative
> volume adjustments. (Apparently it is often done relatively even if we
> have absolute values, for reasons.)
> 
> While these two "actions" can be and probably are mostly "atomic"
> (with the help of mutex) in the kernel drivers *respectively*, they
> are not and cannot be atomic as a whole.
> 
> This won't really be an issue when the actions (either for one or
> multiple channels) are done "synchronously" in *one* program run (e.g.
> amixer -c STX set Master 1+). However, if such a program run is issued
> multiple times "asynchronously" (e.g. binding it to some
> XF86Audio{Raise,Lower}Volume scroll wheel), volume adjustment becomes
> a total mess / failure.
> 
> If it isn't obvious enough. it could happen like the following:
> get1(100 100)
> set1(101 100)
> get2(101 100)
> set2(102 100)
> ...
> 
> Or worse:
> get1(100 100)
> get2(100 100)
> set1(101 100)
> set2(100 101)
> ...
> 
> Not only that it may/will not finish the first set of adjustments for
> all channels before the second, get() from the second set could happen
> before set() from the first, reverting the effect of the earlier
> one(s).
> 
> Certainly one can use something like `flock` with amixer to make sure
> the atomicity of each issue/run, but not only that it looks silly and
> primitive, we don't always manipulate the mixer control with an
> "executable". For example, this weird issue in pulseaudio is probably
> related: https://bugs.freedesktop.org/show_bug.cgi?id=92717
> 
> So I wonder, is there a particular reason that mixer control doesn't
> possess some form of lock, which allows any form of userspace
> manipulation to lock it until what should be / is considered atomic is
> finished?

In the past on the Intel side we had a need for a control 'commit' 
operation, where a set of control values where passed all the way to DSP 
firmware, but were applied at the same time to avoid transients and 
inconsistent states. This was typically required when changing the 
orientation or changing the routing. We solved the problem by having a 
dedicated 'commit' control which gated all others, but there was no 
framework support for this.

These 'commit' operations are quite common in a number of 
specifications, e.g. OpenSL ES, and required when you update filter 
coefficients through independent transactions.

SoundWire 1.2 added support for dual-ranked registers which contains the 
'Current' and 'Next' value, and a commit mechanism to flip the two in 
synchronized ways. This will likely trickle in other hardware standards, 
and indeed I wonder if we should update the control/mixer framework - 
and possibly regmap as well?

It'd be a rather large plumbing exercise but it's worth it IMHO.
-Pierre
