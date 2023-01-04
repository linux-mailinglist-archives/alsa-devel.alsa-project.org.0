Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADFA65E137
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 01:00:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE7DDC78;
	Thu,  5 Jan 2023 00:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE7DDC78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672876838;
	bh=VUK+FoZ6RLONfaaQgaXBjEu8hvOPd1NckTmUOM0ZCK4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bm6f1BLqG+OrebsOVVibdBJ4YdgfZ8ElQbApdGgJrPAM3iw51SaAR9zCLhlKnO3Qq
	 z+6CbWlppdiCSfy8GnppUp9V6Ofx7+4pylMnikiBjxNNZZWmbnOifx+je7oOIs6pXN
	 uPcSwIa9o2omCnhPt7ZFMe6ISz00Rvj9+Pef3WOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD139F8051A;
	Thu,  5 Jan 2023 00:59:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC182F80240; Thu,  5 Jan 2023 00:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6436F8024D
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 00:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6436F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YAc1a+S0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672876764; x=1704412764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VUK+FoZ6RLONfaaQgaXBjEu8hvOPd1NckTmUOM0ZCK4=;
 b=YAc1a+S0bFwto1iEdZP265pYadp00ANkOE5EE0/VrqmWREPNlIKDXjUD
 la0wGTv28xBkhU3vPGKz7tH3yt4IE5mU5Ups1zqiQNSihvndIbwhelaly
 +ZNsZinjC049HzMRfqJPiBGsff1q1kHgB3e97Y9chlxqcUmHcl3+s/Lpp
 kWyS65Q1XAz+E/k4ZEEMLEyNbBkGJTIPHeS7mfRpMASVPjMRYGjgKJ/Qd
 zqzUTWNg0m887a43MhNIGxntnImgD9qomdqlv8Ip9OA6i5wpTONK0YYnM
 ZLVXQAAfrNuuPH8Vnwh8FnaY/msQXkizAhB2IE62MqYCXxFWV8jYDdBeI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="323306093"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="323306093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="900745364"
X-IronPort-AV: E=Sophos;i="5.96,301,1665471600"; d="scan'208";a="900745364"
Received: from kvthalli-mobl1.amr.corp.intel.com (HELO [10.212.102.90])
 ([10.212.102.90])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 15:58:50 -0800
Message-ID: <07443b54-2973-7990-e749-66dd7fb4e499@linux.intel.com>
Date: Wed, 4 Jan 2023 17:51:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 09/14] sound: usb: Introduce QC USB SND offloading
 support
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-10-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221223233200.26089-10-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/23/22 17:31, Wesley Cheng wrote:
> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
> support USB sound devices.  This vendor driver will implement the required
> handshaking with the DSP, in order to pass along required resources that
> will be utilized by the DSP's USB SW.  The communication channel used for
> this handshaking will be using the QMI protocol.  Required resources
> include:
> - Allocated secondary event ring address
> - EP transfer ring address
> - Interrupter number
> 
> The above information will allow for the audio DSP to execute USB transfers
> over the USB bus.  It will also be able to support devices that have an
> implicit feedback and sync endpoint as well.  Offloading these data
> transfers will allow the main/applications processor to enter lower CPU
> power modes, and sustain a longer duration in those modes.

Are you suggesting that the entire feedback loop be handled in the DSP?
It's not clear what "Offloading these data transfers" refers to, the
data part or the feedback path?

Comments are almost inexistent in this patch so it's hard to figure out
what it really does.

