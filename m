Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F421B7990
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 17:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C48C16C2;
	Fri, 24 Apr 2020 17:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C48C16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587742143;
	bh=rK3Bn097f17E5+bGIAZGIpKLJeTfb61OcM7CQKFuhoQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNngscFYVnIXLM/5JRACLGOlj82AXYA1OCkoOTG99YH7V900Az2SBXIjDSLvyY+CW
	 BK9WQtLIv6DuifuyJF7+TvaRu/ILNfeIRIdQId9BAe434vONysMjhDQWLx7PjcEj3V
	 Oqw0o6QI/iQsRTLsMnMf8XcvN7V7h9gnjQ+y/cmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D25C6F80121;
	Fri, 24 Apr 2020 17:27:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05ED8F80142; Fri, 24 Apr 2020 17:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A6FAF800BE;
 Fri, 24 Apr 2020 17:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6FAF800BE
IronPort-SDR: oMtCiYvxkV1+LeU3kn3EbwH4ssxuHANP9lR7+hz0KYnPPTkc14+5VFiW9+kPGIvmLsjxiKimrB
 Sa6MA2PxqxcA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 08:26:44 -0700
IronPort-SDR: ji4pttRNP0Cny4ZZMcZ2f+7haiFwqhCJ7P4u1u/Iy2D7Zp4K4H0vTOG5vMGLEEaybO2QSs1Srv
 rFn+r4Glalcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="274624608"
Received: from jinglu1-mobl1.amr.corp.intel.com (HELO [10.254.176.234])
 ([10.254.176.234])
 by orsmga002.jf.intel.com with ESMTP; 24 Apr 2020 08:26:43 -0700
Subject: Re: [PATCH v4 2/3] ASoC: Intel: Multiple I/O PCM format support for
 pipe
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
 <20200424132002.3850-3-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <57f7b40e-a075-ce2f-917b-cf6f2a198f33@linux.intel.com>
Date: Fri, 24 Apr 2020 10:26:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424132002.3850-3-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: S@alsa-project.org, cezary.rojewski@intel.com, broonie@kernel.org,
 Pavan K <pavan.k.s@intel.com>, tiwai@suse.com
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


> +static int skl_tplg_multi_config_set_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol, bool is_set)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct hdac_bus *bus = snd_soc_component_get_drvdata(component);
> +	struct skl_dev *skl = bus_to_skl(bus);
> +	struct skl_pipeline *ppl;
> +	struct skl_pipe *pipe = NULL;
> +	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
> +	u32 *pipe_id;
> +
> +	if (!ec)
> +		return -EINVAL;
> +
> +	if (is_set && (ucontrol->value.enumerated.item[0] > ec->items))
> +		return -EINVAL;
> +
> +	pipe_id = ec->dobj.private;
> +
> +	list_for_each_entry(ppl, &skl->ppl_list, node) {
> +		if (ppl->pipe->ppl_id == *pipe_id) {
> +			pipe = ppl->pipe;
> +			break;
> +			}
> +		}

is there an alignment issue here or just a diff illusion?

> +	if (!pipe)
> +		return -EIO;
> +
> +	if (is_set)
> +		pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];
> +	else
> +		ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;
> +
> +	return 0;
> +}
> +

You also have a number of other alignment/style issues reported by 
checkpatch.pl

---------------------------------------------------------------
0001-ASoC-Intel-Skylake-Add-alternative-topology-binary-n.patch
---------------------------------------------------------------
CHECK: Alignment should match open parenthesis
#41: FILE: sound/soc/intel/skylake/skl-topology.c:3572:
+		snprintf(alt_tplg_name, sizeof(alt_tplg_name), "%s-tplg.bin",
+				skl->mach->drv_name);

CHECK: Alignment should match open parenthesis
#43: FILE: sound/soc/intel/skylake/skl-topology.c:3574:
+		dev_info(bus->dev, "tplg fw %s load failed with %d, trying 
alternative tplg name %s",
+				skl->tplg_name, ret, alt_tplg_name);

CHECK: Alignment should match open parenthesis
#50: FILE: sound/soc/intel/skylake/skl-topology.c:3581:
+		dev_info(bus->dev, "tplg %s failed with %d, falling back to dfw_sst.bin",
+				alt_tplg_name, ret);

--------------------------------------------------------------
0002-ASoC-Intel-Multiple-I-O-PCM-format-support-for-pipe.patch
--------------------------------------------------------------
CHECK: spaces preferred around that '+' (ctx:VxV)
#58: FILE: sound/soc/intel/skylake/skl-topology.c:597:
+			next_fmt = &pipe->configs[i+1].out_fmt;
  			                           ^

CHECK: spaces preferred around that '+' (ctx:VxV)
#61: FILE: sound/soc/intel/skylake/skl-topology.c:600:
+			next_fmt = &pipe->configs[i+1].in_fmt;
  			                           ^

CHECK: Alignment should match open parenthesis
#86: FILE: sound/soc/intel/skylake/skl-topology.c:640:
+		dev_dbg(skl->dev, "found pipe config idx:%d\n",
+				pipe->cur_config_idx);

CHECK: Alignment should match open parenthesis
#98: FILE: sound/soc/intel/skylake/skl-topology.c:1359:
+static int skl_tplg_multi_config_set_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol, bool is_set)

CHECK: Unnecessary parentheses around 
'ucontrol->value.enumerated.item[0] > ec->items'
#112: FILE: sound/soc/intel/skylake/skl-topology.c:1373:
+	if (is_set && (ucontrol->value.enumerated.item[0] > ec->items))

CHECK: Alignment should match open parenthesis
#135: FILE: sound/soc/intel/skylake/skl-topology.c:1396:
+static int skl_tplg_multi_config_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)

CHECK: Alignment should match open parenthesis
#141: FILE: sound/soc/intel/skylake/skl-topology.c:1402:
+static int skl_tplg_multi_config_set(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)

---------------------------------------------------------------
0003-ASoC-Intel-Skylake-Automatic-DMIC-format-configurati.patch
---------------------------------------------------------------
CHECK: Alignment should match open parenthesis
#40: FILE: sound/soc/intel/skylake/skl-topology.c:1408:
+static int skl_tplg_multi_config_get_dmic(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)

CHECK: Alignment should match open parenthesis
#46: FILE: sound/soc/intel/skylake/skl-topology.c:1414:
+static int skl_tplg_multi_config_set_dmic(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)

CHECK: Alignment should match open parenthesis
#110: FILE: sound/soc/intel/skylake/skl-topology.c:3627:
+		if (dobj->type != SND_SOC_DOBJ_ENUM ||
+				dobj->control.kcontrol->put !=

