Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1A4A7186
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 14:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43FAC1732;
	Wed,  2 Feb 2022 14:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43FAC1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643808442;
	bh=8BGlJgsRd7hGqMtcw7P34/wNlgoKZlN1KDArgo69rzU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tQMU+N81zSJwXWh3fuWCqZ8FwZDxPvKKJsjwgOSLYvt++HfLxkjnPVj/Cd5yWIdwX
	 IgfuCZqBhCyLP0XHlyqobSKpQYMlGEMVjCEYNCUC8LmY83H/oUHULKN1A6RTBE/5Ly
	 zsSNeM4vw6bCat6UgUsvyq4OtHcBDx4kIqji3yGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F21F802E3;
	Wed,  2 Feb 2022 14:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEAFEF804B1; Wed,  2 Feb 2022 14:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7478BF802E3
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 14:26:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7478BF802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WnBfC3/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643808371; x=1675344371;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8BGlJgsRd7hGqMtcw7P34/wNlgoKZlN1KDArgo69rzU=;
 b=WnBfC3/uRA+lvqBPvLA60KVMvlLu1S90JmcnrCgQfWqjIBT0w9EzZpUl
 BL+tjee/J7bMxoKliC5Vwiv81SBYTGIZeT1Wg2GylsmJcjPvEgMfYF3ud
 KhhBDAu0n2Irp4Xz/jST8g4LwfxnfQyOioGFs3eA5AH9uuRiFTKu27cbf
 CgPqr+Aa8rLuAOEXV/edf2tUOoMHDtHKrhdgZo9Ou1/VIrUbqjwOxT34J
 bn+19VAT8LtpMMOuudtW4X0LqDivY+VNwnOZUoK9MYaRtQHP+4Q6yT9mH
 wC5I4RRUw+PM6PhMF8W28itHGADDTlv65YXWzIN4a+2OzzNJtnVt7ElTf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="246743036"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="246743036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:26:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="538247568"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.89])
 ([10.237.180.89])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:26:03 -0800
Message-ID: <7695fc34-143d-7715-85cb-7790386bbacc@linux.intel.com>
Date: Wed, 2 Feb 2022 14:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <YfQhIoXTkzO9AEQc@sirena.org.uk>
 <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 peter.ujfalusi@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com, lma@semihalf.com
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

On 1/30/2022 8:15 PM, Cezary Rojewski wrote:
> 
> path-API found in path.h is limited and maps nicely to DAI operations:
> 
> avs_path_create()
> avs_path_bind(struct avs_path *path)
>      used during DAI's ->hw_params()
> 
> avs_path_free(struct avs_path *path)
> avs_path_unbind(struct avs_path *path)
>      used during DAI's ->hw_free()
> 
> avs_path_reset(struct avs_path *path)
> avs_path_pause(struct avs_path *path)
> avs_path_run(struct avs_path *path, int trigger)
>      state setters, used during DAI's ->prepare() and ->trigger()
> 
> given this picture, one could say that there are framework elements that 
> allow driver writer to implement whatever is needed for DSP-capable driver.

Although Cezary wrote that avs_path_reset/_pause/_run maps nicely to 
trigger operation it's not direct mapping. AVS FW has requirements on 
order of operations on pipelines (which are grouped in paths on kernel 
side). For example on TRIGGER_STOP we need to first pause all pipelines 
before issuing reset to any of them. This is required by FW, so that if 
there are two pipelines it doesn't pause and reset one of them, while 
the other one is still in running state, as this causes xruns on FW side.

Relevant fragment from "[RFC 27/37] ASoC: Intel: avs: non-HDA PCM BE 
operations"
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = avs_path_pause(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+
+		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
+			ret = avs_path_reset(data->path);
+			if (ret < 0)
+				dev_err(dai->dev, "reset FE path failed: %d\n", ret);
+		}
+		break;
+

I would say that such behavior doesn't translate nicely to generic API.


I tried looking once again at how one would split the path concept to 
make it more generic, but it is hard. On one hand paths are tied to AVS 
driver topology design, on the other hand we have (mentioned above) FW 
requirements.

To describe it in more detail, in AVS we need topology as it describes 
bindings between paths. Simple topologies have route map similar to this 
one:

SectionGraph."ssp0_Tx_spt-audio-playback" {
     index "0"

     lines [
         "ssp0 Tx, , ssp0p_be"
         "ssp0p_be, , ssp0p_fe"
         "ssp0p_fe, , spt-audio-playback"
     ]
}

where ssp0p_be and ssp0p_fe are widgets describing BE and FE configuration.

Taking for example FE widget we have:

SectionWidget."ssp0p_fe" {
     index "0"
     type "scheduler"
     no_pm "true"
     ignore_suspend "false"

     data [
         "path_tmpl2_data"
     ]
}

where we can see that apart from its own configuration it has additional 
data describing path inside it:

SectionData."path_tmpl2_data" {
     tuples [
         "path_tmpl2_tuples"
         "path_tmpl2_path0_tuples"
         "path_tmpl2_path0_ppl0_tuples"
         "path_tmpl2_path0_ppl0_mod0_tuples"
         "path_tmpl2_path0_ppl0_bindid0_tuples"
     ]
}

now for the concept of paths the most interesting field is 
"path_tmpl2_path0_ppl0_bindid0_tuples" as it describes to which path we 
want to bind. It is done this way as FW modules internally have pins, 
and while in most cases one wants to just bind on pin 0, sometimes there 
is a need to describe more complicated connections. And so we circled 
back to FW requirements.


Overall I would say that path design in AVS is tied too much to FW 
requirements to be made generic. And even if some general API was 
provided we would still need most of current code on AVS path to handle 
the requirements, while we would have additional constrains coming from 
API above.


> And now back to the _full picture_ that I'm clearly not seeing yet. How 
> do you envision interfaces that should be added to the ASoC framework? 
> Are we talking about soc-path.c level of a change? It would be helpful 
> to have even a single operation (from the list above) drawn as an 
> example of what is expected.


Similarly to the above I'm open to suggestions on how such API may look 
like.

Best Regards,
Amadeusz
