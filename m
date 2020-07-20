Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B38622635A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 17:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A278115F2;
	Mon, 20 Jul 2020 17:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A278115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595259148;
	bh=qMZWC/qkNfQ0MaOkT31qzEJaGXbpAeREngVoVyLuTGc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nov9Hqgbv4bgXVyrLMdx6pKNJoqgy2Ehsn6aWH1052Al57IgARyf63F+hroQghpFg
	 TC+2JXnNf7rJZ1OA/i81VuwEFgxryHQSDNN/vIF5zKl18+4eNFBfvUDZMgV87W/vHi
	 C1aGp1RkddTcI7AUFtooY9JLvCzl+SKaHoW9zXf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF25F800F5;
	Mon, 20 Jul 2020 17:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71832F800F5; Mon, 20 Jul 2020 17:30:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DEF2F800CE
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 17:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DEF2F800CE
IronPort-SDR: E78pH+q6L9CZhLOEhxf1GQFXgtt3Ejiv+En4SHkEn36XJ4/QqdKd3R/ahtoEJSWJfTdy/Vtrrt
 wVB2zHL5jayQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="214613584"
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="214613584"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 08:30:24 -0700
IronPort-SDR: a9Gijm6II6E+qJMQohinNIcnU1FtDFMKcD2Ri2fnzMJ6UxPUr6S9PptB1cd6YZNRfWPx51vPIZ
 sM6EJw6bpS4g==
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="326090814"
Received: from unknown (HELO [10.254.115.28]) ([10.254.115.28])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 08:30:24 -0700
Subject: Re: [PATCH 07/29] ASoC: sof: use asoc_substream_to_rtd()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y2nf0yw2.wl-kuninori.morimoto.gx@renesas.com>
 <87o8ob0yun.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3155783e-0bc2-e031-45f0-7df60454583d@linux.intel.com>
Date: Mon, 20 Jul 2020 10:12:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8ob0yun.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 7/19/20 8:18 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Now we can use asoc_substream_to_rtd() macro,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

I just ran this on the SOF CI and no issues detected:
https://github.com/thesofproject/linux/pull/2300

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

it's a good clean-up, the SOF code was inconsistent with the use of the 
snd_pcm_substream_chip() and direct access to private_data, thanks 
Morimoto-san!
