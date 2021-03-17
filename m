Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DEF33F22F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 15:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C468B18CF;
	Wed, 17 Mar 2021 15:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C468B18CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615989874;
	bh=ScA1sXwxDy/jOvbbgM+xIjZyxNiTmZ1kE67/gKzq2ec=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oyE6zsriY0KVKyRAkcNWKY9T1cu4Q38NUVJ5sNsF01nPcmuxjJO9585BQs8CIv4x0
	 3hwdYpkTeDYd1UUUAG+2q1ncyYRIw1IIUaoERf1fGuC0Oq1bF3rpIDKuhzsvUUCIwK
	 s+8DpLM8rufj72PwqfNvEw/Pyz6aXiGM2FH+627Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD85AF801F7;
	Wed, 17 Mar 2021 15:03:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FC95F8021C; Wed, 17 Mar 2021 15:03:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4005DF80148
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 15:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4005DF80148
IronPort-SDR: 8NyneM84H2WtXgXP2Rcr0Ig9WVbieF1jIlAIiIHCMCoz+wF0snSTiJm/R+0Nmr7DqFQjSE77Bb
 a115KRSl1uSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="189513811"
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="189513811"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 07:02:48 -0700
IronPort-SDR: N26sReSqZARVAAYucfXKIl+FzwROYWD5HOSN4dBKbUvNS7aoqPXtAGsWFOK8O+f/H1fC3k/Ph6
 lzWlaho3z2rA==
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; d="scan'208";a="379296513"
Received: from trentod-mobl.amr.corp.intel.com (HELO [10.212.29.205])
 ([10.212.29.205])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 07:02:44 -0700
Subject: Re: [PATCH v3] ASoC: Intel: sof_rt5682: Add ALC1015Q-VB speaker amp
 support
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org,
 Jack Yu <jack.yu@realtek.com>
References: <20210317110824.20814-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af990f6f-3a8b-3a1e-a02a-3bfe96e4d80a@linux.intel.com>
Date: Wed, 17 Mar 2021 09:02:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210317110824.20814-1-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 3/17/21 6:08 AM, Brent Lu wrote:
> This patch adds jsl_rt5682_rt1015p which supports the RT5682 headset
> codec and ALC1015Q-VB speaker amplifier combination on JasperLake
> platform.
> 
> This driver also supports ALC1015Q-CG if running in auto-mode.
> Following table shows the audio interface support of the two
> amplifiers.
> 
>            | ALC1015Q-CG | ALC1015Q-VB
> =====================================
> I2C       | Yes         | No
> Auto-mode | 48K, 64fs   | 16k, 32fs
>                          | 48k, 32fs
>                          | 48k, 64fs
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>

The code is looks fine, but Jack Yu added a separate patch that makes 
RTL1019 equivalent to RTL1015, so should this patch also handle the 
RTL1019 case?

