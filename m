Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FEF2DCEA1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 10:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09B91853;
	Thu, 17 Dec 2020 10:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09B91853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608198301;
	bh=vDVl1DYfRLb8e/BXBn2rMiLVmdb2GBhu6SclprCNzTk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8khGK+Wl4fXysHvIYfNoZ0aJGU6MkIoU3ggNGMQv54tTXicJ/pIZBRr7ZuVtusLJ
	 3UE4AQCNRZjaXoD/l5PnKCtkU8cBjh3jl70TJY5TMK3LWqpKSqJG/bvmLluDxNXvqU
	 hWg2sEJDlbTKy00jABdrokrQioa4wVCnkzgX9ln0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6008F804AE;
	Thu, 17 Dec 2020 10:44:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A5FF804BD; Thu, 17 Dec 2020 10:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B4DF8014B
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 10:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B4DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="GN3BTU0I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=HHNhKphKZ5QqF9WjO51pWepbtNuJwsgWw1Hcw6UPKx4=; b=GN3BTU0INkArDmJZ3aQuHEzafd
 zzhThECDD6GFVc960TCPKNU7Qg7akHdoXRH9RU1oZ4+KoqkDNKkT78LI5BIVfgTAJl1WnNF28PlU8
 lpKfJ8MZCK4UVYrCZ5dRpQrmEQgwPXLvYCJp0cIYrTSYPcmvQWcXLPnH0OOjjt4zB3N34Nnq3jiiv
 8en6UD52X1B2UkTnVpoWT6PfG5dxj6+efCdoabxlmyBfKiXCgDYZDMkZvB2pm+n0drNaA7wfABJoS
 OTVl/QXy/IrMnyL67Ax6WrCqMqllyqyJEd/AJdmPN6Z957FyPseIymgV5c93+3FIv95RnezqR89Um
 NXan7Xsw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1kppp3-0000rs-QS; Thu, 17 Dec 2020 10:43:46 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1kppp3-000DPQ-Ie; Thu, 17 Dec 2020 10:43:45 +0100
Subject: Re: [PATCH v1 ] ALSA: core: memalloc: add page alignment for iram
To: Robin Gong <yibin.gong@nxp.com>, perex@perex.cz, tiwai@suse.com,
 akpm@linux-foundation.org, xiang@kernel.org,
 pierre-louis.bossart@linux.intel.com, gustavoars@kernel.org,
 shengjiu.wang@nxp.com
References: <1608221747-3474-1-git-send-email-yibin.gong@nxp.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <05c824e5-0c33-4182-26fa-b116a42b10d6@metafoo.de>
Date: Thu, 17 Dec 2020 10:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608221747-3474-1-git-send-email-yibin.gong@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26019/Wed Dec 16 15:36:02 2020)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 12/17/20 5:15 PM, Robin Gong wrote:
> Since mmap for userspace is based on page alignment, add page alignment
> for iram alloc from pool, otherwise, some good data located in the same
> page of dmab->area maybe touched wrongly by userspace like pulseaudio.
>
I wonder, do we also have to align size to be a multiple of PAGE_SIZE to 
avoid leaking unrelated data?

