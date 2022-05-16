Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B25280DC
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 11:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226E915E5;
	Mon, 16 May 2022 11:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226E915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652693313;
	bh=lfcEkVus+NSbE6zckUR45+IvwDuTHB41w/6ZGH1C4pY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAs9YElfZo5jNOHXqzAinndNVXFHV9aTn76YzzLkPnZFze8MGPbfKwCga6xYuDgsp
	 L0Jc7aSpLt3vcmLzNGYEh/O71hqlQ9eO6giM90+pZBE3EtCzCE+8jRHS5smfjvkdPs
	 tt9/VJziyhZDLQTKOHw/zVbQ3EbFqTe1tpoFZozo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DF5F800D8;
	Mon, 16 May 2022 11:27:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCFA3F8014B; Mon, 16 May 2022 11:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06FE3F800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 11:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06FE3F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I7enj9ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652693250; x=1684229250;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lfcEkVus+NSbE6zckUR45+IvwDuTHB41w/6ZGH1C4pY=;
 b=I7enj9kea1HzNXQibHV4zfAejGBI1KGDB0PDfOKnaolULcwcL58YXZJT
 7NwUmGwKV3pWlZuiR1OOnBxS9V+t6/Qz6kYiwSvJaWE3ArlS6FvwPbwrM
 nyfcgSfAa/GXzyy2zf13BznquKZZZ6jjntmnMOhcNlOQkKULnR9dZTsvu
 0bJL+BxTPvEas0Tx/mcvhsSbCDGSuGwMeBgANlWxXf7NJ35uJxT1mGLmS
 nB7kEsrvg0Prwu9++48uYemXZRNlbCvZrFtE2a0gNScUsm+0Zn9DGxTw4
 HGozsegYhxsm8EDSEc21/foDhXcYkLdEKc4acp5gj3ElvZ/ozCeE43prP Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="269605606"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="269605606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 02:27:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596435068"
Received: from afialcko-mobl.ger.corp.intel.com (HELO [10.252.51.55])
 ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 02:27:25 -0700
Message-ID: <1ee5a698-511d-f4f4-ef91-597e29d2f0fc@linux.intel.com>
Date: Mon, 16 May 2022 12:27:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [bug report] ASoC: SOF: ipc-msg-injector: Add support for IPC4
 messages
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YoIRY9gXIlSK+BLb@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YoIRY9gXIlSK+BLb@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

Dan,

On 16/05/2022 11:54, Dan Carpenter wrote:
> Hello Peter Ujfalusi,
> 
> The patch 066c67624d8c: "ASoC: SOF: ipc-msg-injector: Add support for
> IPC4 messages" from May 6, 2022, leads to the following Smatch static
> checker warning:
> 
> 	sound/soc/sof/sof-client-ipc-msg-injector.c:95 sof_msg_inject_ipc4_dfs_read()
> 	warn: userbuf overflow? is '8' <= 'count'
> 
> sound/soc/sof/sof-client-ipc-msg-injector.c
>     72 static ssize_t sof_msg_inject_ipc4_dfs_read(struct file *file,
>     73                                             char __user *buffer,
>     74                                             size_t count, loff_t *ppos)
>     75 {
>     76         struct sof_client_dev *cdev = file->private_data;
>     77         struct sof_msg_inject_priv *priv = cdev->data;
>     78         struct sof_ipc4_msg *ipc4_msg = priv->rx_buffer;
>     79         size_t remaining;
>     80 
>     81         if (!ipc4_msg->header_u64 || !count || *ppos)
>     82                 return 0;
>     83 
>     84         remaining = sizeof(ipc4_msg->header_u64);
>     85 
>     86         /* Only get large config have payload */
>     87         if (SOF_IPC4_MSG_IS_MODULE_MSG(ipc4_msg->primary) &&
>     88             (SOF_IPC4_MSG_TYPE_GET(ipc4_msg->primary) == SOF_IPC4_MOD_LARGE_CONFIG_GET))
>     89                 remaining += ipc4_msg->data_size;
>     90 
>     91         if (count > remaining)
>     92                 count = remaining;
>     93 
>     94         /* copy the header first */
> --> 95         if (copy_to_user(buffer, &ipc4_msg->header_u64, sizeof(ipc4_msg->header_u64)))
>     96                 return -EFAULT;
>     97 
>     98         *ppos += sizeof(ipc4_msg->header_u64);
>     99         remaining -= sizeof(ipc4_msg->header_u64);
>     100 
>     101         if (!remaining)
>     102                 return count;
>     103 
>     104         if (remaining > ipc4_msg->data_size)
>     105                 remaining = ipc4_msg->data_size;
>     106 
>     107         /* Copy the payload */
>     108         if (copy_to_user(buffer + *ppos, ipc4_msg->data_ptr, remaining))
>                                  ^^^^^^^^^^^^^^^
> Potentially writing more than count bytes resulting in corrupting the
> user space memory.

Yes, this can happen.
This is a validation, debugging module, used by developers and testers
only so we did not had the case when the provided buffer would be
smaller than the data we want to retrieve, but the issue is real and I
have sent the fix now.

> 
>     109                 return -EFAULT;
>     110 
>     111         *ppos += remaining;
>     112         return count;
>     113 }
> 
> regards,
> dan carpenter

-- 
Péter
