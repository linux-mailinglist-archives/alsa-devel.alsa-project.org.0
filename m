Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C62C2037
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 09:41:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E446E168A;
	Tue, 24 Nov 2020 09:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E446E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606207265;
	bh=pxqmtk5/OaJeLZ3v+XADzNZmmNxQt38OoL+FYoVFdQs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBCmf67xqzgPtL+Yy0r1JX8/nta5jPAVF94ltafx+WPfDB10nATJgxVUHrwW4M5qq
	 dxTYMvWXHaFFqUNvy0GeXfZ6cQfIEOtPFDSrrctW9r2ItR5NtMBZExW1cjOBiJsYfH
	 DUAu8ttQCsfl3YquIgQErThl0hdlEoZLl04J8r4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FCEF8027C;
	Tue, 24 Nov 2020 09:39:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4555BF80128; Tue, 24 Nov 2020 09:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54CE8F80128
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 09:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CE8F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fARV9Plj"
Received: from localhost (unknown [122.167.149.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C7E8206FA;
 Tue, 24 Nov 2020 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606207189;
 bh=pxqmtk5/OaJeLZ3v+XADzNZmmNxQt38OoL+FYoVFdQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fARV9PljrFrO9MOPpSMv0niQ7g9dGIJw1CQMi+X0IGvaI9tdotf2cUDxNOj0P+cSi
 QNizqze5/eVlibQ9eivR7isQig4WRSkM4OMwcd7rBOCcE78BxwHGkevMHfMjN5CxYK
 ESCeNCDyOzXDQHdR3eZAqdAT+qioPbT4+E2/oS4w=
Date: Tue, 24 Nov 2020 14:09:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: SDCA: detect sdca_cascade interrupt
Message-ID: <20201124083944.GK8403@vkoul-mobl>
References: <20201104152358.9518-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104152358.9518-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 mengdong.lin@intel.com, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 04-11-20, 23:23, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The SoundWire 1.2 specification defines an "SDCA cascade" bit which
> handles a logical OR of all SDCA interrupt sources (up to 30 defined).
> 
> Due to limitations of the addressing space, this bit is located in the
> SDW_DP0_INT register when DP0 is used, or alternatively in the
> DP0_SDCA_Support_INTSTAT register when DP0 is not used.
> 
> To allow for both cases to be handled, this bit will be checked in the
> main device-level interrupt handling code. This will result in the
> register being read twice if DP0 is enabled, but it's not clear how to
> optimize this case. It's also more logical to deal with this interrupt
> at the device than the port level, this bit is really not DP0 specific
> and its location in the DP0_INTSTAT bit is only due to the lack of
> free space in SCP_INTSTAT_1.
> 
> The SDCA_Cascade bit cannot be masked or cleared, so the interrupt
> handling only forwards the detection to the Slave driver, which will
> deal with reading the relevant SDCA status bits and clearing them. The
> bus driver only signals the detection.
> 
> The communication with the Slave driver is based on the same interrupt
> callback, with only an extension to provide the status of the
> sdca_cascade bit.

Applied, thanks

-- 
~Vinod
