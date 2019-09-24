Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB6BBC8F8
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 15:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3FBA1697;
	Tue, 24 Sep 2019 15:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3FBA1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569332082;
	bh=lbAHDPDtcprQSdDMUVskBLFKr0hO2/wsjDWm79C2eRE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuhquPDi7vBlmijRYcS6uP+wz8NgT/fKpMcqUzkfnfIMCQJoMWW/lVspsCTcF6+HU
	 dHDkVJ5Zd+MtmQZBov4e79DKHK/4HepsmHJuLispmW1DIQss9xMPPbjiy4GsGBhufA
	 ECo9WdBdJ+HJJA+mPvSQMOBcHBpYsB/tDQM5wYLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D03F803F4;
	Tue, 24 Sep 2019 15:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B29F8045F; Tue, 24 Sep 2019 15:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C570EF80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 15:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C570EF80213
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 06:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="193446271"
Received: from joshuasw-mobl1.amr.corp.intel.com (HELO [10.251.155.236])
 ([10.251.155.236])
 by orsmga006.jf.intel.com with ESMTP; 24 Sep 2019 06:32:47 -0700
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>, tiwai@suse.de, 
 broonie@kernel.org
References: <1569303443-6838-1-git-send-email-sathyanarayana.nujella@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <617bcff2-db24-c42a-4d74-8bc1428fd95f@linux.intel.com>
Date: Tue, 24 Sep 2019 08:32:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569303443-6838-1-git-send-email-sathyanarayana.nujella@intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, harshapriya.n@intel.com,
 alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 Joyce Toh <joyce.toh@intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Force polling mode on CML for
 fixing codec communication
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 9/24/19 12:37 AM, Sathyanarayana Nujella wrote:
> We observed the same issue as reported by commit a8d7bde23e7130686b7662
> ("ALSA: hda - Force polling mode on CFL for fixing codec communication")
> Apply the same fix to CML.
> 
> Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
> Signed-off-by: Joyce Toh <joyce.toh@intel.com>
> ---
>   sound/pci/hda/hda_intel.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 91e71be42fa4..e6997a5bf098 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -370,6 +370,7 @@ enum {
>   #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
>   #define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0xa348)
>   #define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x9dc8)
> +#define IS_CML(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x02c8)

nit-pick: This should be IS_CML_LP(), there are two separate PCI IDs for 
CometLake LP and H.

>   
>   static char *driver_short_names[] = {
>   	[AZX_DRIVER_ICH] = "HDA Intel",
> @@ -1754,7 +1755,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
>   		azx_bus(chip)->dma_type = SNDRV_DMA_TYPE_DEV_UC;
>   
>   	/* Workaround for a communication error on CFL (bko#199007) and CNL */
> -	if (IS_CFL(pci) || IS_CNL(pci))
> +	if (IS_CFL(pci) || IS_CNL(pci) || IS_CML(pci))
>   		azx_bus(chip)->polling_mode = 1;
>   
>   	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
