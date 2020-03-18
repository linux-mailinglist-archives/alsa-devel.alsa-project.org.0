Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FD189FC3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 16:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B6116AC;
	Wed, 18 Mar 2020 16:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B6116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584545769;
	bh=GuwgJGvTTZLQnAMJT7M/rVuzGfmW6hkwnP8lX85wdqE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZBoOaR5dvNe3WZo5ArgLffCJuMq5n43AxDtUq8fhVxekMf9PFXi9JS/fn+H9RtFUu
	 b06Kvox0EWiqWVCANzlkS9JoCN6cylWbNlrtVS/9Se13vRGJpgXNQLrm6qE2RuNZYu
	 Z+c3XUmSruAU4q4dHoBKuLQ06KXTLU0aM4e/w6OI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11B13F8015B;
	Wed, 18 Mar 2020 16:34:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E12BEF80139; Wed, 18 Mar 2020 16:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AC53F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 16:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AC53F80058
IronPort-SDR: 7WvjkqGv/Kwhp6x4IYIOWYyitO5Mj+PGMYRrVYYnkGhRDZ22uL4WrfPpoFc+ZjlrOpfVQg+iFN
 dm4HsG5V3E8g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 08:34:06 -0700
IronPort-SDR: XnVYRztxzy45MKXqNefl+L21tmw5ERZQX26TNx9ZQsYpmR6b1aqJxkctqgWouhq3KRL3jRYBm3
 HEleVCsc6r9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="244859635"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 18 Mar 2020 08:34:05 -0700
Date: Wed, 18 Mar 2020 17:34:04 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
In-Reply-To: <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
Message-ID: <alpine.DEB.2.21.2003181328110.2957@eliteleevi.tm.intel.com>
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
 <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
 <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.2003181656340.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, cezary.rojewski@intel.com
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

Hey,

On Tue, 17 Mar 2020, Gorski, Mateusz wrote:
> Yes, it is a part of Skylake driver, "hdadsp" is the name of sound card
> created on machine when using HDA generic machine driver. This machine driver
> is made of 2 .c files:
> 
>     - skl_hda_dsp_common.c
>     - skl_hda_dsp_generic.c

btw, this machine driver is also used by SOF, but name is prefixed:

 - HDA with DSP and SST FW -> "hda-dsp" as the card name
 - HDA with DSP and SOF FW -> "sof-hda-dsp" as the card name

And of course without DSP we have also:
 - HDA no DSP	           -> "HDA-Intel" as card name

While we try to share what is possible, the topologies will be different 
for all three, and thus different UCM files are needed.

Br, Kai
