Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF2181446
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 10:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACA01657;
	Wed, 11 Mar 2020 10:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACA01657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583918109;
	bh=0fnkPnhDbxhJeZj6iQ8n6x0QXTV8COoGnVil5LAOtrQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGLa74l6/KR8nWpOadUbOTxpVVd0T7aISE14Avmtr1Sq2zbnWE4ffk9gHE42wbtcd
	 MVpXwa0s4wNe9pg0JT1WlwE+akWWGvPLhLCrh5ApthoBE26Cy/fiQt3azGu3ALXbpT
	 ALOo31iEBebIc3r3mFmSivFoeiFkYROitQhTwGds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B948AF80141;
	Wed, 11 Mar 2020 10:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DBD8F801EB; Wed, 11 Mar 2020 10:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4403F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 10:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4403F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 02:13:19 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; d="scan'208";a="236370847"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.237.139.158])
 ([10.237.139.158])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 11 Mar 2020 02:13:18 -0700
Subject: Re: [PATCH v2] topology: Add topology file for generic HDA DSP
 machine driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309120944.15240-1-mateusz.gorski@linux.intel.com>
 <0d2fb996-2668-e53b-ec91-18bf9e27df31@linux.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <7334e7b6-c4d3-aac3-46d2-b4fbcb0e3957@linux.intel.com>
Date: Wed, 11 Mar 2020 10:13:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0d2fb996-2668-e53b-ec91-18bf9e27df31@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>> +SectionPCMCapabilities."DMIC-Capture" {
>> +    formats "S16_LE"
>> +    rates "48000"
>> +    channels_min "2"
>> +    channels_max "2"
>> +    sig_bits "16"
>> +}
>
> NHLT reports 4 microphones on a number of devices, is there any 
> specific reason to limit the capture to 2ch?
>
> I believe the generic Hdaudio card now reports the number of channels 
> to pulseaudio, so it's possible that PulseAudio would open a 4ch 
> stream but be told sorry no can do by topology.
>
> FWIW we ended-up selecting different topology files in SOF, depending 
> on whether we had 0, 2 or 4 mics.


This patch was prepared to address many issues regarding broken DMIC 
configurations.

You are right - there are different DMIC configurations on different 
devices, but, since path multi-configuration feature is not upstreamed 
in cAVS driver, we are not able to include all of these in one topology 
file.

This is a reference topology, and it was successfully validated on few 
production laptops (including models on which DMIC capture was not 
working).


