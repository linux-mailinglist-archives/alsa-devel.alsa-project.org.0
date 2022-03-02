Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096E4CA9B3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:55:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9819C172C;
	Wed,  2 Mar 2022 16:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9819C172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646236521;
	bh=mXMCLXjmtK6FSV22gB7pjRpMJFpSwkqsDKVea6f74N4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkEle+fx25UiptuO4VQJa80CuvoAfa4uLyRfXYf6g3aAE2xqIIjLS7+ak7/IVUSSQ
	 MihcITZ8YUqK9iepQB/O2TMnLPpL9lsXAhmi8WsGk8LdlRZC1whS7ej3SLsIuRnT21
	 tV1uqTEwoel9L4BP0qf2QI3i3BzVQo4aVlrbktOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B385F804AC;
	Wed,  2 Mar 2022 16:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43343F80154; Wed,  2 Mar 2022 16:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70598F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:54:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70598F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j0DozCEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646236450; x=1677772450;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mXMCLXjmtK6FSV22gB7pjRpMJFpSwkqsDKVea6f74N4=;
 b=j0DozCEj8aG7L80y0/cDMBwuIF71AYZoOsr4EPx8vLtgERug3WLcpcFV
 6gXsQi6lsZXYcuKk/htdFpNJAs1CycnxgIXtMp0XkOXi6fM2pPQ3wiQT3
 1uGJmR+3+Xu8FmexfSn2PVp50iXZLqmm0xncW06GroKUdConmXHhHclw3
 akJ8NsqkheAESuXkYIS7iYJBWoabd6p9HqasXRz/rQT7Ey8PhWdWT50VK
 M2LRoufQyJ8pDDk9wx+FM8vMvttINkEgoN9OH2USzHP0ahhX+C/eWf0KX
 QgfLfnCZ0NIpyoSC4IjdrbVKEdPFJ8CS1fa9Xy2WsZ7TfuWMk1FlEgRF+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234049411"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="234049411"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:54:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="535435315"
Received: from tpthomas-mobl2.amr.corp.intel.com (HELO [10.212.252.17])
 ([10.212.252.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:54:04 -0800
Subject: Re: [PATCH 6/8] ASoC: Intel: cirrus-common: support cs35l41 amplifier
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-7-pierre-louis.bossart@linux.intel.com>
 <b03ca8eb-0ceb-6814-e947-baf3a15f7fe9@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <35a5435c-5d24-3957-1892-4b5c3c67a241@linux.intel.com>
Date: Wed, 2 Mar 2022 09:46:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b03ca8eb-0ceb-6814-e947-baf3a15f7fe9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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


>> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
>> @@ -0,0 +1,163 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * This file defines data structures and functions used in Machine
>> + * Driver for Intel platforms with Cirrus Logic Codecs.
>> + *
>> + * Copyright 2022 Intel Corporation.
> 
> (c) seems to be missing? All other boards have it in some form.

Indeed that's a miss, will fix.

>> +++ b/sound/soc/intel/boards/sof_cirrus_common.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * This file defines data structures used in Machine Driver for Intel
>> + * platforms with Cirrus Logic Codecs.
>> + *
>> + * Copyright 2022 Intel Corporation.

and here too.
