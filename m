Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD92FBA98
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 15:59:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F1818A7;
	Tue, 19 Jan 2021 15:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F1818A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611068393;
	bh=L60KYqMQwfm0ne0TltV38hPXkFcoWAsd13jc6AI1Pf8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjJxnc36aLwSGLGP0if5EEehnIiTsAZP1FM4/T9vLxjyN1jjsBGbNkSDfCbhUinEh
	 CxQyVCqORuadx8JKvdl8vbzDrbz5cnEDK6J7gCeV7KHILuVFsyUqzBNkRd0TpaGLUU
	 w3sHXwR6QyVHhEB2YANJJM1DmgsVcC0k8wmTKGGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E562F8026A;
	Tue, 19 Jan 2021 15:58:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DB5F80257; Tue, 19 Jan 2021 15:58:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61DA8F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 15:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61DA8F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IOE4TBNs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F8A120DD4;
 Tue, 19 Jan 2021 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611068294;
 bh=L60KYqMQwfm0ne0TltV38hPXkFcoWAsd13jc6AI1Pf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IOE4TBNsMeCowfuGT+DEUPtXXmRivlzIRV15sF/st+1cQ8pTKEDYqD6mqlJChJWeB
 BSYdEiRIjzM1yJFIxZzdbMikw0esJR70VA/6fI4ICobwQsWOTQ6AtwLOWPToJ3AkJp
 93SmktmT5I48MUSuYv4yfeC+5O9dIvpC6rFdZmRxTZ0fX/k2fOd9112TFIjQ+ZGZHq
 2qWxi+K/3wDO8GXR82mqE3D0mK9pW4xsxtjlmdn33g1UrzP9nA6SxEUzhFJKoes8B6
 qAVbxJp3JiUyO2mvdAvP9SmVO/mwt7RcyJfDKfngGxOoxH8FNRt3yPaM4OyXlTD8Tc
 MR0mD3RdpyX9A==
Date: Tue, 19 Jan 2021 20:28:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/5] soundwire: fix ACK/NAK handling and improve log
Message-ID: <20210119145808.GW2771@vkoul-mobl>
References: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 15-01-21, 13:37, Bard Liao wrote:
> The existing code reports a NAK only when ACK=0
> This is not aligned with the SoundWire 1.x specifications.
> 
> Table 32 in the SoundWire 1.2 specification shows that a Device shall
> not set NAK=1 if ACK=1. But Table 33 shows the Combined Response
> may very well be NAK=1/ACK=1, e.g. if another Device than the one
> addressed reports a parity error.
> 
> NAK=1 signals a 'Command_Aborted', regardless of the ACK bit value.
> 
> Move the tests for NAK so that the NAK=1/ACK=1 combination is properly
> detected according to the specification.
> 
> Also, improve the demesg log to get more information for debugging.

Applied, thanks

-- 
~Vinod
