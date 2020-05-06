Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B991C7608
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 18:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8759C1773;
	Wed,  6 May 2020 18:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8759C1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588781659;
	bh=aH3Q0WQnmtzDKh0GuRVgXgBeVz1l5BCk0k5umGqU6/E=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etLDyp5u3hGBgndibpHPDib3n7rrkebjimWxYBwy6O4uYIrjpFCL4/47rHg6CsEbQ
	 R3DLgOSDDiIUATgaFhQ8SVtj4lcxZH+WJaUJptyNrhN1zrPapzia1eju/qQEYZqbZE
	 MZb97ToWoo/Tyy/h6cpSZkR/kBTO1+2N+URV4mKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC9ABF800DE;
	Wed,  6 May 2020 18:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A5DF80249; Wed,  6 May 2020 18:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C12FFF800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 18:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C12FFF800AD
IronPort-SDR: v1E3CLSUFGwonLD6RWplKF6KLrWZk2j7zp4eOS2EinixqyfCv8oYYlWZVaPEe5x6wB5ziadyfw
 rzQad0unfypw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 09:12:23 -0700
IronPort-SDR: NOAfkdK19OS7XIm55yw+N3YrPpwhcapAGB/PmXnxZmF2WpE2OENiFtWDlIx77Q426IB3UvryWD
 PLm0HZxEFWdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,359,1583222400"; d="scan'208";a="249808805"
Received: from sbhat1-mobl.amr.corp.intel.com (HELO [10.251.3.11])
 ([10.251.3.11])
 by fmsmga007.fm.intel.com with ESMTP; 06 May 2020 09:12:21 -0700
Subject: Re: Keeping the codec running at all times
To: Jaroslav Kysela <perex@perex.cz>, Ricard Wanderlof <ricardw@axis.com>,
 alsa-devel <alsa-devel@alsa-project.org>
References: <alpine.DEB.2.20.2005061709110.12526@lnxricardw1.se.axis.com>
 <7a54134e-ce30-d7d5-bcf3-31269f1103f1@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73594637-b978-aca8-e81e-be72a5075ae8@linux.intel.com>
Date: Wed, 6 May 2020 11:12:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7a54134e-ce30-d7d5-bcf3-31269f1103f1@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



>> In certain system-on-chip systems, with separate ADCs and DACs for
>> instance, the ADC could generate clocks for the DAC, where it not for the
>> fact that ALSA shuts down whatever device is not being used in order to
>> conserve power. Is it possible to instruct ALSA not to do this, i.e. once
>> a codec has been configured to operate at a given sample rate, it will
>> continue to do so, even after all streams have stopped.
>>
>> I suppose one way to do this would be to change the codec 
>> set_bias_level()
>> callback so that the BIAS_OFF and BIAS_STANDBY cases don't do anything 
>> but
>> leave the codec running. But it doesn't sound like a clean way of doing
>> this.
>>
>> Of course, one complication is that at system startup, before any capture
>> or playback operations have been attempted, ALSA doesn't know which 
>> sample
>> rate should be configured, as there is no concept of a 'default sample
>> rate'; the sample rate is always set when a stream is opened.
> 
> The driver may limit the available rates (thus it may be possible to set 
> the one accepted rate via the module parameter or so which may be used 
> for the codec initialization before an application uses the PCM device).

It's a valid request, some platforms want to avoid any glitches due to 
clocks and require that they remain active, even if it means writing-off 
power optimizations.

If your codec exposes a clock object then you could have e.g. a board or 
machine driver configure the clock 
(clk_get/clk_set_rate/clk_prepare_enable) and leave it on regardless of 
the streaming usages. You would still need to make sure that the clock 
rates are compatible with the hw_params when streaming does happen.
that's what e.g. was done for Intel to make sure the MCLK, BCLK and 
FSYNC could be enabled even when the DSP was idle.
