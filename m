Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEE4C9281
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 19:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81A951A9A;
	Tue,  1 Mar 2022 19:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81A951A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646157761;
	bh=oHU/6gh5SgHwpNSNOMcEN9t7/YXWOSIPfNfwrRjNbh0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ci+0+eRznjrzjRBSJSGSB5OuSL+J8keFOUiwT++bCQUblm59fypSMNxIQAoQZInoZ
	 LAAV3K0ZzGUOmEXN4hGv2HsSK1jwqXKO+2tULstFntSnxN+JkN2PKNWmnx5/HFxIeW
	 e1mJHLrGXvRs9BaJQHDs8e7dSbnTiDAUclA4FX10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF18AF802D2;
	Tue,  1 Mar 2022 19:01:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AC3CF80227; Tue,  1 Mar 2022 19:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31662F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 19:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31662F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KcdhmhG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646157687; x=1677693687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oHU/6gh5SgHwpNSNOMcEN9t7/YXWOSIPfNfwrRjNbh0=;
 b=KcdhmhG/MnMLk7D9l5M6KhBv5gV43mWNO3wRHpfuSK9K8hY/4guoSB/1
 zsO/AzPsEdflK0YdcX9qIUs9ARy8nYHtPVeFMojrM6cGL+hu/83sViz97
 73r52Mi8d8LwW8+hcW1fBdxSp+sveIAam166F1fOHcuMTGQFDeQ8R3vMf
 /DLpgbiTIGeQf+0HYFwuNFfgGDW/Ys1JAzaMVz+47bHo87G6uORhWebgd
 Yiqk86dWAlXn2I5/Tq9A1ROoRqfer3NKera3aDuk0jT/AZyfrPgA4DcNF
 HOpqkZywAeMRzc1IqweZz6WUASYP2lzSYaYfzGqKmmmMy6YZj4BN7O+/7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="313919580"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="313919580"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:01:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="545182885"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO [10.209.131.146])
 ([10.209.131.146])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 10:01:04 -0800
Message-ID: <6da7f4db-02dd-cebc-e672-ab0ab0b2a9f5@linux.intel.com>
Date: Tue, 1 Mar 2022 12:01:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220228153343.2263412-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228153343.2263412-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Sparse seems to have difficulties with your {0} initializations?

export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all -Wno-bitwise-pointer
-Wno-pointer-arith -Wno-typesign -Wnoshadow"

make sound/soc/intel/avs/ C=2 -k
  GEN     Makefile
  CHECK   /data/pbossart/ktest/broonie-next/scripts/mod/empty.c
  CALL    /data/pbossart/ktest/broonie-next/scripts/checksyscalls.sh
  CALL    /data/pbossart/ktest/broonie-next/scripts/atomic/check-atomics.sh
  DESCEND objtool
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/dsp.c
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/ipc.c
  CC [M]  sound/soc/intel/avs/messages.o
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:18:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:72:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:90:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:110:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:127:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:145:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:146:37:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:225:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:255:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:289:39:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:381:37:
error: missing braces around initializer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/messages.c:452:39:
error: missing braces around initializer
make[4]: ***
[/data/pbossart/ktest/broonie-next/scripts/Makefile.build:289:
sound/soc/intel/avs/messages.o] Error 1
make[4]: *** Deleting file 'sound/soc/intel/avs/messages.o'
  CC [M]  sound/soc/intel/avs/utils.o
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/utils.c
  CC [M]  sound/soc/intel/avs/core.o
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/core.c
  CC [M]  sound/soc/intel/avs/loader.o
  CHECK   /data/pbossart/ktest/broonie-next/sound/soc/intel/avs/loader.c
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/loader.c:339:47:
error: Using plain integer as NULL pointer
/data/pbossart/ktest/broonie-next/sound/soc/intel/avs/loader.c:405:47:
error: Using plain integer as NULL pointer

