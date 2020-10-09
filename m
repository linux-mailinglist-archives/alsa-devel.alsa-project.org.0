Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E701288C8E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 17:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD571683;
	Fri,  9 Oct 2020 17:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD571683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602257283;
	bh=+l1YGwIoxQNEKKn0cxK5Eysi330bCQbn/dG6DyQq76A=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iO1ezTzo+aG3THVSP4zaoRoieWA2kJ7TCORx7weQzNRSHXoOg1gX45RiX9bdHmdum
	 ZlOrnAUwSrwtJhLFZFTDDjRZL7+i2vGxcUkbj3H0L0C0BiED1/xWXQ/iIutBbNZgv9
	 UT09YL6x7a2xFtnpNuiFeGExHdmJf3LcPdG/IfD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73112F80165;
	Fri,  9 Oct 2020 17:26:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7516F8015B; Fri,  9 Oct 2020 17:26:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52027F800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 17:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52027F800BF
IronPort-SDR: R/y4cFgO8vq6pgfGc0psdTuRjHfU+3bPKlCxcaXdN7v6i3K67P7U49yfPvx/nvsY4/a//nXZzi
 tARYFq0KmxSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145364032"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145364032"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 08:26:13 -0700
IronPort-SDR: EXc7zDId3ju/6+Q/wSI/kaR10O1v/Rf/6//5Fc8CThge8YkR8HH/1fbrHoF97K6vuz0KoW5fu+
 rxLJDtc6Bbbg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="528972606"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 08:26:11 -0700
Date: Fri, 9 Oct 2020 18:24:25 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/1] ALSA: hda: fix jack detection with Realtek codecs
 when in D3
In-Reply-To: <s5h4kn3tqkh.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2010091819310.3186@eliteleevi.tm.intel.com>
References: <20201009140227.691140-1-kai.vehmanen@linux.intel.com>
 <s5h4kn3tqkh.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

On Fri, 9 Oct 2020, Takashi Iwai wrote:

> On Fri, 09 Oct 2020 16:02:27 +0200, Kai Vehmanen wrote:
> > -	if (status && from_rt) {
> > -		list_for_each_codec(codec, &chip->bus)
> > +	if (from_rt) {
> > +		list_for_each_codec(codec, &chip->bus) {
> > +			if (codec->forced_resume && pm_runtime_suspended(hda_codec_dev(codec)))
> > +				pm_request_resume(hda_codec_dev(codec));
> > +
> >  			if (!codec->relaxed_resume &&
> >  			    (status & (1 << codec->addr)))
> >  				schedule_delayed_work(&codec->jackpoll_work,
> >  						      codec->jackpoll_interval);
> > +		}
> >  	}
> 
> Basically both pm_request_resume() and the jackpoll_work do the
> equivalent task, hence no need to do twice differently.  Actually
> pm_request_resume() looks like a better choice as it's clearer about
> what it does, so let's replace with it.

ack. I was unsure whether the other actions in jackpoll_work would be 
needed in some case (when jackpoll_interval>0), but I guess if interval is 
non-zero, the workqueue is kicked from the codec driver, so no need to do 
it here. Will change.

> Also, the pm_runtime_suspend() can be skipped here; the codec must
> have been suspended at this moment because of the pm-dependency.

Oh, true, you are right.

> So, it'll be like:
> 
> 	if (from_rt) {
> 		list_for_each_codec(codec, &chip->bus) {
> 			if (codec->relaxed_resume)
> 				continue;
> 			if (codec->forced_resume ||
> 			    (status & (1 << codec->addr)))
> 				pm_request_resume(hda_codec_dev(codec));
> 		}
> 	}
[..]
> Could you check whether this still works?

Sure, not necessarily today, but I'll get back with the test results.

PS And Pierre, indeed it is sufficient to just power the codec on. 
   Even if it then goes back to suspend, jack detection still works.
   And if controller never goes to suspend, then there's no problem 
   either. I'll update the commit message for v2.

Br, Kai
