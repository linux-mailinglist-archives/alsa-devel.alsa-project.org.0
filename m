Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320F25BD81
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 10:42:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8468118D3;
	Thu,  3 Sep 2020 10:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8468118D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599122545;
	bh=/RhL1+Os0ZHjkfhSyZSXiOAfORqfkCbABBv7SoNeSus=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHa5tdxnosTgqZ7/0NKBclAIDc0spp7xyUtV5PooUt48PWnrRPUqDkphXrAuttgHn
	 fDj569aXPXoj0Wkl2IuJjHTFInCEsa+wjw3yjYRYVTZhRMOp32mQB+thEorfSLGyXh
	 rTUYGYcQ61fJwRTRFnvbufZPWnu43iW17JDM9VLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A62F801DA;
	Thu,  3 Sep 2020 10:40:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D0D8F80217; Thu,  3 Sep 2020 10:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB83FF801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 10:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB83FF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bqv3xA8Z"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A650206C0;
 Thu,  3 Sep 2020 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599122437;
 bh=/RhL1+Os0ZHjkfhSyZSXiOAfORqfkCbABBv7SoNeSus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bqv3xA8ZsbL4xC45ykIHJ3xL4LxR6kgq8JH3vNz6QsLqABuwb+j0v/e8bQtPJcnO4
 uIEC6+0nhPjNhUTiHlLZCuF18W+QHuyFLqrkKvJdff1OkX6DfTs4JFuXfaFflrpavS
 nrDQ/cuSnGXpIB5oSpsCKMZEsQDwLNImH5lnrzM8=
Date: Thu, 3 Sep 2020 14:10:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH v2] soundwire: fix double free of dangling pointer
Message-ID: <20200903084033.GN2639@vkoul-mobl>
References: <20200902202650.14189-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902202650.14189-1-trix@redhat.com>
Cc: alsa-devel@alsa-project.org, ndesaulniers@google.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, shreyas.nc@intel.com,
 natechancellor@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com
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

On 02-09-20, 13:26, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this problem
> 
> stream.c:844:9: warning: Use of memory after
>   it is freed
>         kfree(bus->defer_msg.msg->buf);
>               ^~~~~~~~~~~~~~~~~~~~~~~
> 
> This happens in an error handler cleaning up memory
> allocated for elements in a list.
> 
> 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> 		bus = m_rt->bus;
> 
> 		kfree(bus->defer_msg.msg->buf);
> 		kfree(bus->defer_msg.msg);
> 	}
> 
> And is triggered when the call to sdw_bank_switch() fails.
> There are a two problems.
> 
> First, when sdw_bank_switch() fails, though it frees memory it
> does not clear bus's reference 'defer_msg.msg' to that memory.
> 
> The second problem is the freeing msg->buf. In some cases
> msg will be NULL so this will dereference a null pointer.
> Need to check before freeing.

Applied, thanks

-- 
~Vinod
