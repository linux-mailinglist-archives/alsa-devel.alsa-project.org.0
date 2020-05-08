Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ABA1CB24E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 16:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932671694;
	Fri,  8 May 2020 16:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932671694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588949532;
	bh=wrVoMXITvCB52FY9wn1E/4JkYJp/a6J+1YCmq/DRliE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NFICJT5zBOQUH+kR/f3goP4mcChq946OKnYEH1GXqcyQZbTyRYdRmeJO5WfKHJzo+
	 pBPeWjWKtSxDVz0GgTBfV2Dp06GzzvQRdBJrf0byt9VWiQcmQoPxfVWxykeuZPwkFa
	 f/K+usl8KfJcwDmSVIbS/yDBZ0zL+iwHNwgy2pU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7255F8023E;
	Fri,  8 May 2020 16:50:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB32BF80249; Fri,  8 May 2020 16:50:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BE2DF80234
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 16:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE2DF80234
IronPort-SDR: DYnoC/GYmEXW6kiOqtvyFIq1bUt3zOlGCB51nq/fjjEpNdhDft8Hs0oEz3a4ph1FzH0WGP6dnb
 XW2buaxgXlJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 07:50:17 -0700
IronPort-SDR: XN15M4RZFAHyjTWmo7AtUbiSDyZx81DyK5bKtQiRsCXpzx/sNnNOgIdU1OG0jfg4rvR24YVvk2
 JtBq1K2Ceo0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; d="scan'208";a="462307831"
Received: from cstrong-mobl6.amr.corp.intel.com (HELO [10.254.74.61])
 ([10.254.74.61])
 by fmsmga005.fm.intel.com with ESMTP; 08 May 2020 07:50:16 -0700
Subject: Re: [PATCH] ASoC: Intel: Boards: Support headset button function for
 nau88l25max and nau88l25ssm
To: Radoslaw Biernacki <rad@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200507220332.24686-1-rad@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <39aed974-ee2c-a0e7-9228-304cce275289@linux.intel.com>
Date: Fri, 8 May 2020 09:45:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507220332.24686-1-rad@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Chinyue Chen <chinyue@chromium.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Ben Zhang <benzh@chromium.org>,
 Marcin Wojtas <mw@semihalf.com>, Benson Leung <bleung@chromium.org>,
 Alex Levin <levinale@google.com>
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



On 5/7/20 5:03 PM, Radoslaw Biernacki wrote:
> Map the buttons from the Android reference headset to
> KEY_PLAYPAUSE, KEY_VOICECOMMAND, KEY_VOLUMEUP, and KEY_VOLUMEDOWN.
> KEY_PLAYPAUSE is used instead of KEY_MEDIA for BTN_0 as it is more
> logical and have much broader userspace support. Like Chrome OS
> use it to play/pause of video and audio. KEY_PLAYPAUSE is also
> supported by Android (USB headset spec requires KEY_PLAYPAUSE
> for BTN_0.)
> https://source.android.com/devices/accessories/headset/usb-headset-spec
> 
> Signed-off-by: Chinyue Chen <chinyue@chromium.org>
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
