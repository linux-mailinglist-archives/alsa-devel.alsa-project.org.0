Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F164F21E5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 06:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA2A1679;
	Tue,  5 Apr 2022 06:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA2A1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649132376;
	bh=DA6uMLvp/9YEcI9TewrH+tVj6sA1lozPencPzepXYCA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJkNfpRD+DrswC6M8Zr24jbPZYlPNrYEDh+Z0CEdJ9q4zZ3WK3k+MbV7eWRFfK/hx
	 fjBK8N4Q/lyRW60do1sE15KWw/3AUWxlQQqTbDHIyNcjlcYgMRyO0eUCD+1INYtoyQ
	 foYNtAwRaf51dfcNFAWlShjbN0Z23CJ/vRkPUORk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07B9F8016B;
	Tue,  5 Apr 2022 06:18:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C356F8016A; Tue,  5 Apr 2022 06:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8033F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 06:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8033F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z5dW1I05"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4F040B818F8;
 Tue,  5 Apr 2022 04:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85417C340F0;
 Tue,  5 Apr 2022 04:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649132310;
 bh=DA6uMLvp/9YEcI9TewrH+tVj6sA1lozPencPzepXYCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5dW1I05rgukaZq1vTHq5kXrq62Y9a6G+Lz8OxCfzky1ft9SSCDnDFexN9sKb6/iT
 rc9tnobefW7WAvK0XN5bVdKjPyL0YIKvtm1/TXyUNuDEsnPci/sJow4+xbBbKWRm2q
 Mh3igWR7KY3YbFFuOMSQCtHpOvZfA5V9Rxidq8jgGjyrB214SwwudkS9cj+mxVWwUw
 bsa8y0c2zni67nvZsEB5IZ7EBFNB9ZAUX8X3fKJGUYopb2qgrjeEJva8PaPiFN+G9P
 syIittDkBx7FOp3/D2Tigx+zKO5xEa7mVafgWp6rYu6FhUeJnH0Z8WxgVCrbIfaV3y
 /gVgDbdsVC1kg==
Date: Tue, 5 Apr 2022 09:48:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Wang Wensheng <wangwensheng4@huawei.com>
Subject: Re: [PATCH -next] soundwire: stream: Fix error return code in
 do_bank_switch()
Message-ID: <YkvDEvoWMZJn1fIQ@matsya>
References: <20220307074039.117488-1-wangwensheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307074039.117488-1-wangwensheng4@huawei.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, xuqiang36@huawei.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 07-03-22, 07:40, Wang Wensheng wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.

Applied, thanks

-- 
~Vinod
