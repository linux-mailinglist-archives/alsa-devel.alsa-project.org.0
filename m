Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3544CA8A4
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 15:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167781F0C;
	Wed,  2 Mar 2022 15:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167781F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646233063;
	bh=G5tPcw3JMbTMUFqmS1I82jzhfr5fG9MatTHRp3Klm6Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9S2a5WddkiXGvdseyGAHzDYkf0xyL38KxVYXfWYbv2gGUwYeq5CX0C+yKx5ULbRf
	 f1QqlFAlnhw81NFAlZIu8bzZ5XCB8gHhPswG/DAkemYCT5JwDVfsWisURJlC7N9xw0
	 uIVYSL+KDWKueKmwBJ4FFXX358OYKFP2wUyjyzNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E168F80054;
	Wed,  2 Mar 2022 15:56:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A112DF80054; Wed,  2 Mar 2022 15:56:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B26E4F80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 15:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B26E4F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MhqB4Czw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646232988; x=1677768988;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=G5tPcw3JMbTMUFqmS1I82jzhfr5fG9MatTHRp3Klm6Q=;
 b=MhqB4CzwZko4N5LQzvREf7zI6dAegxHWOa+cA+VUpOa79OYn6rLwk7pa
 P5dN7iVw40Q/xWb31ouPT4oiUxMVEasCTuCcxNkXmonvZk6Vap3T668Qh
 gDpZ69N5C2szFc7IhApCKcI3Yb/a4TUJrrt4OHKSQMs2Hx8cY2kV+aj/B
 Y/gZUE5/t+dn/X+ROzBSHBGJrCZbbxKeV09vrGfyja8CWEjf+nmM5PCEg
 WTqBv+AGTNxId7lYTEcBWlaQwkd7ceV7BR7JqfQ4GTSDZiE42ARwfL2Uq
 qTbZgBXgjXVds1sEkW+LHc382nftQrckac1nmzp5pJVa6LXppshTz7Dpy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="250990371"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="250990371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 06:56:23 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="535414847"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.26])
 ([10.99.241.26])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 06:56:21 -0800
Message-ID: <e597f364-96b6-08b1-3c88-436693c65b04@linux.intel.com>
Date: Wed, 2 Mar 2022 15:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 7/8] ASoC: Intel: sof_ssp_amp: rename driver and support
 cs35l41 amplifier
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-8-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220301194903.60859-8-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 3/1/2022 8:49 PM, Pierre-Louis Bossart wrote:
> From: Brent Lu <brent.lu@intel.com>
> 
> Add support of CS35L41 amplifier to the machine driver, as well as
> the support of HDMI playback and BT offload DAI Link.
> 
> Rename the driver to a generic name to support different amplifiers
> from different vendors.
> 
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Eh... rename should happen in separate patch, as there seems to be some 
changes done to the file and it is quite hard to review it, when whole 
file is in diff due to being moved.

