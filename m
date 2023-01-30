Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26999680782
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 09:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469F7DED;
	Mon, 30 Jan 2023 09:35:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469F7DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675067776;
	bh=GBIpIc+A10cwgQqoTcUX1briJX8R+8iaF6VJFNW2w1o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hEN3sOgGagAfbFqth3iIvrHmXg8PqKturJz/8/6hvWbgxrYbeu2x7rWePLQ18w6Dv
	 DB9MoaYSM0QcmcLdJqj1SmHwrR7eDfjFjDmq7A8EUwjePiPZxOznOtufupVCT+Lmlq
	 YbEKv+3VGULVNqFf/dZQATicZk3q4RwyrY7Ni850=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7A3DF8047D;
	Mon, 30 Jan 2023 09:35:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C135F8045D; Mon, 30 Jan 2023 09:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3657F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 09:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3657F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lFOKeQfu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675067712; x=1706603712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GBIpIc+A10cwgQqoTcUX1briJX8R+8iaF6VJFNW2w1o=;
 b=lFOKeQfuqq1yXhB2q1wAzdZqIeNedZvG+Zbh/3CeOP3scyoFL477g5Ua
 2hwEeMrVKRroO4FtD1sladdJ5uW6HEklDyFrXZKZeUXLk4Uogg39Vw6qV
 PImsOWJ0qA/9Ls70xwTSChES6imfBsnNODVARfOZYORy0KsN+tyM5goK1
 aMpeZA2p95FSvAfteCmaOCqQO6/flWawxsVq5W0YA26WOBkVQpLEAaDIx
 JwGZmBG/bXgvQwhUvm9yGnrrrskNujtbfz6mbF90f33Ni2ucx8eTvDipi
 rffODSFhpTm4/l8YKpPmlFl05Uc+cL8Ez1Rs+pMJUyHNOiOChgvzDgV11 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="327521044"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="327521044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 00:35:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="772405473"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="772405473"
Received: from zhoufuro-mobl.ccr.corp.intel.com (HELO [10.249.170.163])
 ([10.249.170.163])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 00:35:01 -0800
Message-ID: <7f461661-2dcf-056d-f78a-93c409388f29@linux.intel.com>
Date: Mon, 30 Jan 2023 16:34:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v2 07/22] ASoC: Add SOC USB APIs for adding an USB
 backend
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-8-quic_wcheng@quicinc.com> <Y9UiiMbJFjkzyEol@kroah.com>
 <7c1d80b6-5db3-9955-0a67-908455bd77fa@linux.intel.com>
 <Y9YbumlV9qh+k68h@kroah.com>
Content-Language: en-US
From: Zhou Furong <furong.zhou@linux.intel.com>
In-Reply-To: <Y9YbumlV9qh+k68h@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2023/1/29 15:09, Greg KH wrote:
> On Sun, Jan 29, 2023 at 02:54:43PM +0800, Zhou Furong wrote:
>>
>>
>>>> +void *snd_soc_usb_get_priv_data(struct device *usbdev)
>>>> +{
>>>> +	struct snd_soc_usb *ctx;
>>>> +
>>>> +	if (!usbdev)
>>>> +		return NULL;
>>>
>>> How could usbdev ever be NULL?
>> The method is exported to public, valid check should be reasonable
>> as someone may call it by mistake
> 
> We do not protect the kernel from itself like this, no need to check
> things that should never happen.  If the caller gets it wrong, their
> code will break :)
> 
> thanks,
> 
> greg k-h

Thank you Greg!

This has been confused me for long time when I found Linux kernel don't 
check input even for public method.

