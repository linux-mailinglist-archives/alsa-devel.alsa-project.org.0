Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689668658E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 12:48:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60949100;
	Wed,  1 Feb 2023 12:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60949100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675252128;
	bh=/ALzJVdP2Kp36MbSmFOUicnglPjjzV+XSKJYlOzn1Gs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TFu2QPtJtC2fWeDm9BIAmZG6X7HpfdpxGr9w1G9nA33I1it4M9jSjPzo3YVIxAETW
	 AmFH0Z/IYCaYlZ26UD9lH0gY3uSNkI0+3WIP7FjC3cp2QeaqFxKZ1O/lCdAhHK2yT7
	 25bfUhoAIbbd4cvYX0iIKSgdMNgAMqCu5iqgJDEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E7ADF8032B;
	Wed,  1 Feb 2023 12:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A6D0F80423; Wed,  1 Feb 2023 12:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B262CF80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 12:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B262CF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l6cuKOOv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675252065; x=1706788065;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/ALzJVdP2Kp36MbSmFOUicnglPjjzV+XSKJYlOzn1Gs=;
 b=l6cuKOOvAP/o2y/0osYruSvPVy9ub8GFoOFxzKtup80IR0Zvy2Asd4DY
 9KgrGRmYtKyF9wKh1mtpmoYz4TAGxAR8n+wW+L3N3GmDMhj1Q/RVUhjyP
 v7EVoRxfWSC9PkQijjPCMxG+ScIhFHeHNIqfyN/SWs/AZT0u/nBWmj4H7
 gFrGeKvOkBs4BzKnwx07PVHNy8y00j4YVI5AFWvLO86SO9CTJTyox0IT7
 BIvOBOs5UttMZ/lM2+qdOa6+832z3VNoHbpzS2kN6npBvr7SsmGp1XiG8
 vq7EcQSxNvAAX3f3eG6IYyCtZeNX1T2dBLzC9U0CgEwD/CyG0wDh4FeKA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="325820903"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="325820903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:47:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="642379629"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; d="scan'208";a="642379629"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 03:47:39 -0800
Message-ID: <9720a055-2b61-80b8-4009-cc7448af25e5@linux.intel.com>
Date: Wed, 1 Feb 2023 12:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] ASoC: topology: Set correct unload callback for graph
 type
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, kuninori.morimoto.gx@renesas.com
References: <20230201112846.27707-1-peter.ujfalusi@linux.intel.com>
 <20230201112846.27707-3-peter.ujfalusi@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230201112846.27707-3-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/1/2023 12:28 PM, Peter Ujfalusi wrote:
> Using the control_unload for graph type of elem will lead surprises on
> module unload.
> 
> The correct callback to use is the dapm_route_unload.
> 
> Fixes: 31e9273912bf ("ASoC: topology: Use unload() op directly")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

LGTM, thanks!

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

