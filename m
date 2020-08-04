Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24423BD41
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 17:37:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048071664;
	Tue,  4 Aug 2020 17:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048071664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596555439;
	bh=nx+4Nc3PT+iW5kpWPtP2193zmZ/8FUaaKi+wVGNPIpk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVf9OrY5ruBCVbELW0HXp3OS59FoMbxzvlObYxg8Rh17cTbbFjJOpmQIU9cuO/60u
	 883Qy6jJsdN/fh8ADw9LUoug58xh3OeprYwvJ9EjQAap9siYzmWU8zyVmHd70Itg2r
	 4V0++PHC+PlrxvvfXvGd6XmJ4+vU3LdbWHOj8rNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7FEF8015A;
	Tue,  4 Aug 2020 17:35:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 335B4F80124; Tue,  4 Aug 2020 17:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB966F80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 17:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB966F80124
IronPort-SDR: DJ8aNmaC5mZVm0wGozq8RJzXfI6eml0IvV+UfBD0fhmeRURYDL3HJrFzKOoY/T2ACMkdx2jdP+
 011py/iQ2Kew==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="150127459"
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="150127459"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 08:35:24 -0700
IronPort-SDR: O49ImPuff9KfnAi5VM8bqIOtDJmPqAWyFAn3D4lCfS7qw7Y2OenpDZ0CMz7AN1b30Izk5M0/8r
 rSyR5arV+T6Q==
X-IronPort-AV: E=Sophos;i="5.75,434,1589266800"; d="scan'208";a="288602707"
Received: from gggmerek-mobl.amr.corp.intel.com (HELO [10.212.131.193])
 ([10.212.131.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 08:35:23 -0700
Subject: Re: Lenovo m720s combined audio jack not working (ALC233)
To: Bastien Nocera <hadess@hadess.net>, alsa-devel@alsa-project.org
References: <fd8d4a187c86c3514e4442a404ad2568014c5d0b.camel@hadess.net>
 <def6195d-776d-409d-518c-872a0dff17b6@linux.intel.com>
 <f834d46cae7cc772d48c03ba298bda2681208a28.camel@hadess.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2a9b913a-207e-a982-931b-8f016cc2fa22@linux.intel.com>
Date: Tue, 4 Aug 2020 10:35:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f834d46cae7cc772d48c03ba298bda2681208a28.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Pearson <markpearson@lenovo.com>
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


> What sort of "event" are you talking about? I see events on the input
> device that's associated with the jack, though I don't know how that
> gets routed inside ALSA.

The values of '* Jack' mixers are used by UCM, so you can look at them 
with amixer. I can never remember the amixer syntax so what I do is list 
the controls with 'amixer -Dhw:0 controls' and then check their values 
with 'amixer -Dhw:0 cget num_id=<num_id from list>'

> In any case, the module option seems to bring it back to a working
> state. Any hints as to what to do now for the PulseAudio bug report if
> I wanted to diagnose and report this is a UCM problem?

ok, that's progress if this is not a codec issue :-)

I only have a limited understanding of jack detection, but all UCM 
configs for your case should be in [1].

I would check if the value of the controls with amixer and maybe if the 
control name is wrong. Today 'Headphone Mic Jack' or 'Mic Jack' are 
used, and I wonder if this is 'Front Headphone Jack' in your case. Maybe 
you can share the alsa-info results so that we can all check if there's 
a naming issue.

[1] 
https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/HDA-Intel/HiFi-analog.conf
