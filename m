Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED0367D194
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:27:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8E2E89;
	Thu, 26 Jan 2023 17:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8E2E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674750450;
	bh=VoCnjpuatxN+O2Dg71Cb0IcLA9Rb+BbQQjLiUoOMEUc=;
	h=Date:From:Subject:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ob9Agumz/agW4rtPqOlYwTuhZAfBAQpnXpj47jAZvWIJkxyE4YmMbVJQfv9E1wdUH
	 ET+ss/YzNI3hp3pWY2Ju/PitCXdng+uWTEMDZlmUk4h5d7ZltRquslbtmEIZzTJLSe
	 YQ8fw4yk8cVjBM9GnCGvLkWFBURFfuZWsFx6de5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CE4F8057A;
	Thu, 26 Jan 2023 17:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8EE8F80563; Thu, 26 Jan 2023 17:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE242F802DF
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE242F802DF
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FwKzXYgJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674750288; x=1706286288;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=VoCnjpuatxN+O2Dg71Cb0IcLA9Rb+BbQQjLiUoOMEUc=;
 b=FwKzXYgJOPH0TEfk3MnnNRtbf8a4nSpUa85m0VhEC/C//6gv+LED1Hjt
 3gIr4GRlp+OzwUHDO5N/t8Vi7HqjIwJe0zcqw1TEoaDvfJMfXFhHNAkNG
 7dXDLnqo1a26UFwoGt/7Pc7sGphGvwgxaTOSB/WCtrBDlaEqcncyGbUYR
 Orz0Kefob2PjWElcmKB/6s4t4KV22hMUGK2ol7tesxm6VoiWB4BSO3OGo
 iMD0ljeBwK9jMgYQ30zhVuwZqedtbN0NSlckJJRTfK9nf8TRDu8N+oMRb
 DJ5XAcuwgl6ws0jDm8yjFODVcJikuXCqZW4qGLY1rbsYw+eX/Ss+8NfYZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354154746"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="354154746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="612855103"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; d="scan'208";a="612855103"
Received: from nmani1-mobl2.amr.corp.intel.com (HELO [10.209.167.178])
 ([10.209.167.178])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 08:24:44 -0800
Message-ID: <ad9e375e-fe4f-b4bd-aebd-26f5f0a6317b@linux.intel.com>
Date: Thu, 26 Jan 2023 10:22:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH v2 00/22] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230126031424.14582-1-quic_wcheng@quicinc.com>
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

This version has lots of improvements, but I am concerned
about hard-coded ops/callbacks that look racy and assume dependencies
between driver probes. How does this work if the probe is delayed on one
side for some reason? What happens is a driver is 'blacklisted' and
manually added later? The code has to deal with this sort of known unknowns.

I also still have a bit of heartburn with the notion that there would be
a completely separate card with all the control for volume/mute/etc
having to be duplicated.

It's still a lot of good work so thanks for sharing and pushing for this
capability.


