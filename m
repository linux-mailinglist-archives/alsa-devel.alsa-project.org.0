Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156F545535
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 21:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7131AD1;
	Thu,  9 Jun 2022 21:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7131AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654804716;
	bh=gSO+qLuc8qtp/wzgQmhNQ7+NJ91g5Pot6Tsh7n4NrQg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/VhFSzA6v+0zTDXFP+rOk+qANZbSBdn0BPF0qPHrEjU+MK8uqu2vlkmi92GBhTwO
	 Ue91ediErf+Ic5lqc59QzQK0sOT1u3bOfoHUaqYHVCxMz9/OqnErfFAttDg9KlGUtt
	 pE5sNzmh+C+fcQAB9Bd+3R/LAnm2RUjg134uQ9Qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3368BF80240;
	Thu,  9 Jun 2022 21:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F37F801F5; Thu,  9 Jun 2022 21:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC205F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 21:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC205F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="npiE0C3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654804650; x=1686340650;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gSO+qLuc8qtp/wzgQmhNQ7+NJ91g5Pot6Tsh7n4NrQg=;
 b=npiE0C3Vj33tUvn0GiyNNuBGxkxU4HeblkkP9smTAkkde/oyobwvgNRj
 c/hwNRFHyN40ab8W7udyclXRC+EO/cWnoDcFTfboPAS1ozJ2p8bzJWtLb
 pqcoQhqz3qI2hCpaPlSjmvtb349MtTjCcv0LnIUrLxKeaPWr5vaH6GVPv
 BMVlENzHUF3bOPcHq9RH5MxjYjmjhTOYJRKBo4MzKAUvviBvjWPpeLs6t
 saWPTa8k4P4Vt5/Q7bQUX67EXt27x67rJ3x+F05aJgGSjiMdFXjmlaUNr
 ga/A1M/Fq5Bxo3cPTTKQPG+KzOJGuNeFymQI/7k/QbkzBBP/r6NmzvteP w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="277429861"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="277429861"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 12:57:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="585777224"
Received: from jeremywe-mobl3.amr.corp.intel.com (HELO [10.209.173.145])
 ([10.209.173.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 12:57:19 -0700
Message-ID: <af6d9ad3-eca9-9721-4fc0-055752e3b6da@linux.intel.com>
Date: Thu, 9 Jun 2022 14:57:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/14] ASoC: Intel: avs: Add topology parsing
 infrastructure
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
 <20220331135246.993089-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220331135246.993089-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


> +static int
> +avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
> +{
> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
> +	guid_t *val = (guid_t *)((u8 *)object + offset);
> +
> +	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
> +
> +	return 0;
> +}

Cezary and Amadeusz, could you please look into this 'make W=1' error?

make allmodconfig
make sound/soc/intel/avs/ W=1

  GEN     Makefile

  CALL    /data/pbossart/ktest/work/scripts/checksyscalls.sh

  CALL    /data/pbossart/ktest/work/scripts/atomic/check-atomics.sh

  DESCEND objtool

  CC [M]  sound/soc/intel/avs/topology.o

In file included from /data/pbossart/ktest/work/include/linux/string.h:253,

                 from /data/pbossart/ktest/work/include/linux/bitmap.h:11,

                 from /data/pbossart/ktest/work/include/linux/cpumask.h:12,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/cpumask.h:5,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/msr.h:11,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/processor.h:22,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/cpufeature.h:5,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/thread_info.h:53,

                 from
/data/pbossart/ktest/work/include/linux/thread_info.h:60,

                 from
/data/pbossart/ktest/work/arch/x86/include/asm/preempt.h:7,

                 from /data/pbossart/ktest/work/include/linux/preempt.h:78,

                 from /data/pbossart/ktest/work/include/linux/spinlock.h:55,

                 from /data/pbossart/ktest/work/include/linux/mmzone.h:8,

                 from /data/pbossart/ktest/work/include/linux/gfp.h:6,

                 from /data/pbossart/ktest/work/include/linux/firmware.h:7,

                 from
/data/pbossart/ktest/work/sound/soc/intel/avs/topology.c:9:

In function ‘fortify_memcpy_chk’,

    inlined from ‘guid_copy’ at
/data/pbossart/ktest/work/include/linux/uuid.h:43:2,

    inlined from ‘avs_parse_uuid_token’ at
/data/pbossart/ktest/work/sound/soc/intel/avs/topology.c:134:2:

/data/pbossart/ktest/work/include/linux/fortify-string.h:352:25: error:
call to ‘__read_overflow2_field’ declared with attribute warning:
detected read beyond size of field (2nd parameter); maybe use
struct_group()? [-Werror=attribute-warning]

  352 |                         __read_overflow2_field(q_size_field, size);

      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cc1: all warnings being treated as errors



