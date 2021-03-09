Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED82332F32
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 20:43:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616CA173C;
	Tue,  9 Mar 2021 20:42:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616CA173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615319022;
	bh=aBLZFZuboy+xD71ku90XoPlwbveXLcmQmtOqmsbwPCk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBzsYtqfAVkA7mp5cxN0Pqa2+cknuvB9hdhdkQ/okYu5L8no3yWxT11mw0LfQjwo5
	 tmhoLRrv9vOnq61iOsslRBGAR8VdEE20V8DxsaEGAPJPYcW+rgbK1530fq4Qi5/8VY
	 ydBQUcbO//X9XFqnL/gvPUzxxgKW6vQITGr4pJNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE0EFF80166;
	Tue,  9 Mar 2021 20:42:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7E67F8019B; Tue,  9 Mar 2021 20:42:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37590F800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 20:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37590F800D0
IronPort-SDR: 8YLxskMaYgwLPpsf79LlOEp0FTOVQke8czlhEs9klBXit48qJFvdOuuaS4NbRnNy0X/pxCkBkT
 IpRXzJd4LuxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188353890"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="188353890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 11:41:48 -0800
IronPort-SDR: CcuWziOV8r+3pfJrl+fnBlyvOCafqG+gqjr7zBk88xXNo6XphpN8KI+eY84qjypFt3sD7nuo+K
 ZsZ6YHLywf4g==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="437748702"
Received: from ankitama-mobl1.amr.corp.intel.com (HELO [10.209.121.187])
 ([10.209.121.187])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 11:41:47 -0800
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
To: Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
Date: Tue, 9 Mar 2021 13:41:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210303115526.419458-1-jonathanh@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
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



On 3/3/21 5:55 AM, Jon Hunter wrote:
> Many systems do not use ACPI and hence do not provide a DMI table. On
> non-ACPI systems a warning, such as the following, is printed on boot.
> 
>   WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The variable 'dmi_available' is not exported and so currently cannot be
> used by kernel modules without adding an accessor. However, it is
> possible to use the function is_acpi_device_node() to determine if the
> sound card is an ACPI device and hence indicate if we expect a DMI table
> to be present. Therefore, call is_acpi_device_node() to see if we are
> using ACPI and only parse the DMI table if we are booting with ACPI.

That change introduces a regression on all our tests: the names are not 
correctly set, which will prevent UCM from loading the relevant profiles 
based on the long name.

Before:
  0 [sofhdadsp      ]: sof-hda-dsp - sof-hda-dsp
                       AAEON-UP_WHL01-V1.0

After:
root@plb-UP-WHL01:/proc/asound# more cards
  0 [sofhdadsp      ]: sof-hda-dsp - sof-hda-dsp
                       sof-hda-dsp

The problem is that the cards are platform devices created by the parent 
(which itself may be a PCI or ACPI device) and have nothing to do with ACPI.

Could we flip the logic and instead explicitly detect OF devices? That 
restores functionality for us.

Jon, would this work for you?

Thanks!

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 16ba54eb8164..5c40b4548413 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card 
*card, const char *flavour)
         if (card->long_name)
                 return 0; /* long name already set by driver or from DMI */

-       if (!is_acpi_device_node(card->dev->fwnode))
+       if (is_of_node(card->dev->fwnode))
                 return 0;

         /* make up dmi long name as: vendor-product-version-board */


> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V1:
> - Use is_acpi_device_node() to determine if we expect the DMI table to
>    be present.
> 
>   sound/soc/soc-core.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index f6d4e99b590c..0cffc9527e28 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -31,6 +31,7 @@
>   #include <linux/of.h>
>   #include <linux/of_graph.h>
>   #include <linux/dmi.h>
> +#include <linux/acpi.h>
>   #include <sound/core.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
> @@ -1573,6 +1574,9 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>   	if (card->long_name)
>   		return 0; /* long name already set by driver or from DMI */
>   
> +	if (!is_acpi_device_node(card->dev->fwnode))
> +		return 0;
> +
>   	/* make up dmi long name as: vendor-product-version-board */
>   	vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
>   	if (!vendor || !is_dmi_valid(vendor)) {
> 
