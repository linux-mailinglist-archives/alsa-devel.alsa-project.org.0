Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D34122D76C2
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 14:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650B21768;
	Fri, 11 Dec 2020 14:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650B21768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607694035;
	bh=uS0nAf/tZm41rt4IuB27w/7b30kdyViyiELdYB3l4sg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdkCzxjPdFvxyjd7SUZjlbCBB/NL/qnTXv2IHOeCXLNbpdaDGvPS+RNYduuvPUY6I
	 bkF6UY3aOR0x6mQz+TN+Cqc3DNq35sXkCgr/qwUAHpV1bfTw9zdgSuerbQnrvx86iT
	 WGfg+W0IOmDzAF7nIvSasKzOpHat6oNwC9H8Gg/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA8E6F8020D;
	Fri, 11 Dec 2020 14:39:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA4ECF8020D; Fri, 11 Dec 2020 14:38:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 156BAF80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 14:38:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 156BAF80105
IronPort-SDR: WsOyBmcTyQA4CRbBJynPZ6fjoKKRD3eSOASMprAD7YBjCUU6vQAgrwK6VIN2HkXY9edr9icvvz
 3rfUO6j2+bIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="174543883"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174543883"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:38:48 -0800
IronPort-SDR: 1hD5RjtMvNg2i9bysekS9G1oFTxtbSbHcBky3lxCUg7X2Cmv4V6zDEhvEH6m2kOpD04l045nhs
 BuESam9lEJYA==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="440967359"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:38:46 -0800
Date: Fri, 11 Dec 2020 15:36:04 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>, Hui Wang <hui.wang@canonical.com>
Subject: Re: [RFC][PATCH 0/2] design a way to change audio Jack state by
 software
In-Reply-To: <575811fc-cb64-c7d4-bf6b-5044949a326c@perex.cz>
Message-ID: <alpine.DEB.2.22.394.2012111522490.864696@eliteleevi.tm.intel.com>
References: <20201209124344.219158-1-hui.wang@canonical.com>
 <575811fc-cb64-c7d4-bf6b-5044949a326c@perex.cz>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Wed, 9 Dec 2020, Jaroslav Kysela wrote:

> Dne 09. 12. 20 v 13:43 Hui Wang napsal(a):
> > After we change sth in the userspace audio stack like alsa-ucm or
> > pulseaudio, we want to perform remote audio auto test to verify if the
> > change introduce the regression or not, some of the tests are about
> > the defaut_sink/default_source or active_port switching, this needs

thanks Hui for the RFC.

I do think this is a very tempting capability to add. I understand 
Jaroslav's concerns as well, but there is clearly a category of issues 
where user-space functionality is broken due to a mismatch of element 
names between UCM file and the driver. I.e. the actual jack detection 
(codec hw and its driver) is working, but due to wrong UCM file chosen, 
wrong driven is chosen, or errors in either UCM or driver, event does not 
get parsed right and user ends with no audio.

A pure user-space test harness would not catch these, and building full 
automation of external codec events, is a complex task and coverage of 
devices is likely limited. 

The 'edid_override' debugfs interface in i915 is a bit similar. It allows
inject EDID content irrespectively of the actual monitor connected.

> Also, the first patch can be omitted if you just create another
> snd_jack_report() function for the user API and put the common code to the
> static function in jack.c.

++votes on this

Br, Kai
