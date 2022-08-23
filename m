Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10F59D6B5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 11:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521F6851;
	Tue, 23 Aug 2022 11:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521F6851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661247844;
	bh=h6CWLqvVRXjQzjVwGf64vvc1NtiK5BwrrHRF8qaa67M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ExMHA4cDgqA1zQt55WBVmMAx9g5rol3Zt3vW9JPwTFMIE88NJFwuUcDokTSumiKZC
	 fK01OD8J3XivwY6uv01a6Gtc2tT5OqXR1tNJQpSC22ySMrik/ey0dpHoqtRUAOxREU
	 PQ0ua5Bn/Gk8ZvcyBpZv2ozCGPXuyUAVx1N8mQI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4E23F800A7;
	Tue, 23 Aug 2022 11:43:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69E74F8027B; Tue, 23 Aug 2022 11:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B30A7F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 11:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B30A7F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CzgYecBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661247780; x=1692783780;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h6CWLqvVRXjQzjVwGf64vvc1NtiK5BwrrHRF8qaa67M=;
 b=CzgYecBu3U2wGJUUY86DxD71OJcE1C2U1vv+m0JojP34Xy7obbYC/+vg
 Ttd3IxBAJy2n9qVlZC9QhDxlRaDrl482hfquU6mPCG1BIqnvjWSJ9fmZi
 we1Qb2BptMZiR1Ad0ScU0caeKxslc5plOCrMrquUpX7Cha3iYVzQQke+7
 SWPymhaYefJt1fJhzee+XjBhEE8eIegRsYpsB10EgA6/1rNy+9iHqNV47
 xKR1EKGwvimjWKNJXalXoMUNAKt0a9uyC6plaehX8pFUw7qDsytFAs/89
 a7XSt4dNOJ2gXp3j+lAdqWEJI7yp2JLnqM9rZ0cnuw+TqG+GOO85jO9fP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294431352"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="294431352"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 02:42:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="609284389"
Received: from pnystrom-mobl1.ger.corp.intel.com (HELO [10.252.50.219])
 ([10.252.50.219])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 02:42:39 -0700
Message-ID: <47d5c5d7-5aaf-c554-a943-6059b38d2dcd@linux.intel.com>
Date: Tue, 23 Aug 2022 10:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
 <20220822185911.170440-3-pierre-louis.bossart@linux.intel.com>
 <87zgfvqs1p.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zgfvqs1p.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi Takashi,

>> +#define SSP_BLOB_V1_0_SIZE		84
>> +#define SSP_BLOB_V1_0_MDIVC_OFFSET	19 /* offset in u32 */
>> +#define SSP_BLOB_V1_5_SIZE		96
>> +#define SSP_BLOB_V1_5_MDIVC_OFFSET	21 /* offset in u32 */
> 
> This is 84 in bytes, which is equal with SSP_BLOB_V1_0_size.
> So...
> 
>> +			for (j = 0; j < fmt->fmt_count; j++) {
>> +				u32 *blob;
>> +				int mdivc_offset;
>> +
>> +				if (cfg->config.size >= SSP_BLOB_V1_0_SIZE) {
>> +					blob = (u32 *)cfg->config.caps;
> 
> ... the size check is >= 84.  If cfg->config.size==84, it may be an
> out-of-bound read at blob[SSP_BLOB_V1_5_MDIVC_OFFSET]?
> 
> I don't think this would really matter in practice, but it's better to
> have a proper check, of course.

The check was intended to be a minimal check but you're right that it
doesn't cover the 1.5 case.

it might make more sense to first make sure we have enough space to read
the version and then check for an exact match between expected size and
actual size before reading the mdivc value.

Will fix, thanks for the feedback.
-Pierre
