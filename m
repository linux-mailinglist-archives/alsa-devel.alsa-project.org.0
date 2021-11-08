Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DF448066
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 14:40:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB32A1666;
	Mon,  8 Nov 2021 14:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB32A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636378854;
	bh=CrHP5NclVNyUq69I51rHPowogQnUmiCP6Jq80Vci0L4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KqENloGar9z9GCG3gzOo2Zb1M7qepBy6byEPFqKj5EQok0mCKCURfcYpLzYhbhuf1
	 btcqx6VmWXmTb2TSUAXP7ydQsC+J31bmNXDbazsTE6QPud4lufFlDXMLjEGHNJK+bb
	 AP+DXBVKWqMhNvtL+MIlXv2TEbzyNNnSVbgaWFZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F2DCF804BC;
	Mon,  8 Nov 2021 14:39:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D3FFF8049E; Mon,  8 Nov 2021 14:39:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 620EBF801D8;
 Mon,  8 Nov 2021 14:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 620EBF801D8
X-IronPort-AV: E=McAfee;i="6200,9189,10161"; a="212267307"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="212267307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 05:39:33 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="533315761"
Received: from anushave-mobl1.amr.corp.intel.com (HELO [10.255.85.158])
 ([10.255.85.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 05:39:31 -0800
Subject: Re: [PATCH] ASoC: SOF: build compression interface into snd_sof.ko
To: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
References: <20211108111132.3800548-1-arnd@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <63c5b1fb-575e-f026-5a76-f08a366f7f38@linux.intel.com>
Date: Mon, 8 Nov 2021 07:39:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108111132.3800548-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Bud Liviu-Alexandru <budliviu@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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



On 11/8/21 5:11 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With CONFIG_SND_SOC_SOF_COMPRESS=m, the compression code is
> not built into a the main SOF driver when that is built-in:
> 
> x86_64-linux-ld: sound/soc/sof/ipc.o: in function `ipc_stream_message':
> ipc.c:(.text+0x5a2): undefined reference to `snd_sof_compr_fragment_elapsed'
> x86_64-linux-ld: sound/soc/sof/topology.o: in function `sof_dai_load':
> topology.c:(.text+0x32d1): undefined reference to `snd_sof_compr_init_elapsed_work'
> x86_64-linux-ld: topology.c:(.text+0x32e1): undefined reference to `snd_sof_compr_init_elapsed_work'
> 
> Make this a 'bool' symbol so it just decides whether the
> code gets built at all.
> 
> Fixes: 858f7a5c45ca ("ASoC: SOF: Introduce fragment elapsed notification API")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

It's Monday morning and my memory is still foggy but I think we fixed
this problem with https://github.com/thesofproject/linux/pull/3180,
where we changed the Kconfigs for i.MX. We haven't sent this update
upstream for some reason.

Arnd, can you share the configuration that breaks with the existing
upstream code, I can check if the problem still exists.

Thanks!
