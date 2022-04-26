Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAAC510C01
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21FCE17F9;
	Wed, 27 Apr 2022 00:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21FCE17F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011898;
	bh=ftM0fcE4GaiSImgZEA3q1nzC5UKMEusnjsjrvmxeVac=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+V6pw36IJ8LjijghkVRLS/VTJeB3mz2ooApPGLk2CHISAiDBteSh01AIZwbqaeOi
	 Oxt3tMLAzK7NiqzFIJugmlIT2r7483pBpXadhPRKaksiWqy2tJTa/s/VVrPuQeHcU7
	 781lrDYj3bEsPlCjobtc8Brv/lmwX+tbA8WJMggg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9D2F804AC;
	Wed, 27 Apr 2022 00:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE137F80508; Wed, 27 Apr 2022 00:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25266F800FA
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25266F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IO0UYcRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011801; x=1682547801;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ftM0fcE4GaiSImgZEA3q1nzC5UKMEusnjsjrvmxeVac=;
 b=IO0UYcRLeljSt64mtOmOyhYfXXU/TiKkcJMVDsO9yhPLW2oIfUrWxBqC
 z1LXOlt8zvaMvQ63qR5XC3cSrnGR8rU4ElHA342yI3Yz1eXfDtpAlVdMK
 Q3oo2C+L48Yu1NR8IgeMmfH7utxiRwORUbFYQY+uP1H62Z4wDfMEdZuQT
 tP4LzVKSLklUuvddGKac1cAbtNcdGiSRF9yOeRFazMmNyjtQmxP7AllJo
 df0TXwg2u5IrUtzJ9jAcackkr7GDrp+AxqJvHNoDfxhE6EC0Dg+G+PwIx
 2j6EVzgZyeDOYlvHYrbuLAk9KIlib/QhO+NQqSIFKpduK1oUbNRXWeHgg g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660711"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660711"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888597"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:11 -0700
Message-ID: <988b37aa-a7ce-af9a-76b0-3c4036ba7884@linux.intel.com>
Date: Tue, 26 Apr 2022 16:33:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] ASoC: Intel: avs: Generic soc component driver
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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



> +struct avs_dma_data {
> +	struct avs_tplg_path_template *template;
> +	struct avs_path *path;
> +	/*
> +	 * link stream is stored within substream's runtime
> +	 * private_data to fulfill the needs of codec BE path
> +	 *
> +	 * host stream assigned

not able to parse that comment, what are you trying to say?

> +	 */
> +	struct hdac_ext_stream *host_stream;
> +};
> +
> +static ssize_t topology_name_read(struct file *file, char __user *user_buf, size_t count,
> +				  loff_t *ppos)
> +{
> +	struct snd_soc_component *component = file->private_data;
> +	struct snd_soc_card *card = component->card;
> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
> +	char buf[64];
> +	size_t len;
> +
> +	len = snprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
> +		       mach->tplg_filename);
> +
> +	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
> +}
> +
> +static const struct file_operations topology_name_fops = {
> +	.open = simple_open,
> +	.read = topology_name_read,
> +	.llseek = default_llseek,
> +};

can you clarify why this is needed?

> +
> +static int avs_component_load_libraries(struct avs_soc_component *acomp)
> +{
> +	struct avs_tplg *tplg = acomp->tplg;
> +	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
> +	int ret;
> +
> +	if (!tplg->num_libs)
> +		return 0;
> +
> +	/* Parent device may be asleep and library loading involves IPCs. */
> +	ret = pm_runtime_get_sync(adev->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(adev->dev);
> +		return ret;
> +	}

Mark recommends the use of pm_runtime_resume_and_get(), see patches from today.

> +
> +	avs_hda_clock_gating_enable(adev, false);
> +	avs_hda_l1sen_enable(adev, false);
> +
> +	ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
> +
> +	avs_hda_l1sen_enable(adev, true);
> +	avs_hda_clock_gating_enable(adev, true);
> +
> +	if (!ret)
> +		ret = avs_module_info_init(adev, false);
> +
> +	pm_runtime_mark_last_busy(adev->dev);
> +	pm_runtime_put_autosuspend(adev->dev);
> +
> +	return ret;
> +}
> +
> +static int avs_component_probe(struct snd_soc_component *component)
> +{
> +	struct snd_soc_card *card = component->card;
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_soc_component *acomp;
> +	struct avs_dev *adev;
> +	char *filename;
> +	int ret;
> +
> +	dev_dbg(card->dev, "probing %s card %s\n", component->name, card->name);
> +	mach = dev_get_platdata(card->dev);
> +	acomp = to_avs_soc_component(component);
> +	adev = to_avs_dev(component->dev);
> +
> +	acomp->tplg = avs_tplg_new(component);
> +	if (!acomp->tplg)
> +		return -ENOMEM;
> +
> +	if (!mach->tplg_filename)
> +		goto finalize;
> +
> +	/* Load specified topology and create sysfs for it. */
> +	filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
> +			     mach->tplg_filename);

what is the link between topology and sysfs?

> +	if (!filename)
> +		return -ENOMEM;
> +
> +	ret = avs_load_topology(component, filename);
> +	kfree(filename);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = avs_component_load_libraries(acomp);
> +	if (ret < 0) {
> +		dev_err(card->dev, "libraries loading failed: %d\n", ret);
> +		goto err_load_libs;
> +	}
> +
> +finalize:
> +	debugfs_create_file("topology_name", 0444, component->debugfs_root, component,
> +			    &topology_name_fops);

that's debugfs here, is this to make it possible to select an alternate topology file? If yes, a comment earlier wouldn't hurt.

> +
> +	mutex_lock(&adev->comp_list_mutex);
> +	list_add_tail(&acomp->node, &adev->comp_list);
> +	mutex_unlock(&adev->comp_list_mutex);
> +
> +	return 0;
> +
> +err_load_libs:
> +	avs_remove_topology(component);
> +	return ret;
> +}
> +


> +static const struct snd_soc_component_driver avs_component_driver = {
> +	.name			= "avs-pcm",
> +	.probe			= avs_component_probe,
> +	.remove			= avs_component_remove,
> +	.open			= avs_component_open,
> +	.pointer		= avs_component_pointer,
> +	.mmap			= avs_component_mmap,
> +	.pcm_construct		= avs_component_construct,
> +	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
> +	.topology_name_prefix	= "intel/avs",

is this intentional that the firmware binaries and topologies will be stored in the same intel/avs directory?

> +	.non_legacy_dai_naming	= true,

is this needed? we've never used this for Intel?

> +};
> +
