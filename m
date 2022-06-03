Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058D53C4CA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 08:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F717181F;
	Fri,  3 Jun 2022 08:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F717181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654237211;
	bh=O7xwFuoO/XKDvGiUPnjd28Zynwy08WHLO07AR/MtjMU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j93EjkfHVowiJM2tftekkqcYVh+JblcnXT9TJZcRIZ1tLOHJYT5Tf1Ue7q7dbcd8T
	 N9/Vlz+fHtGohMJezXHFARvtk59wNTUpXVgwmOThJGPt1ZhPI080L4Ept6OPhPdBHt
	 JQBBdp+zlvoevgsvlOmmALYB+oNJP4aHnsC64ooU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D26F804D1;
	Fri,  3 Jun 2022 08:19:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54DF7F804CC; Fri,  3 Jun 2022 08:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45850F80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 08:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45850F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HZl7q/pV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654237147; x=1685773147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O7xwFuoO/XKDvGiUPnjd28Zynwy08WHLO07AR/MtjMU=;
 b=HZl7q/pVdsyjOO+EvEqEbE1yTJgYezJCiN1LyHo2QwVtQJKMcaR8qQbP
 Uas9DKRtEifZV7k5lQFli167ZpcqoeAB1lN52tf0s+QgRTuGQDuGFr+64
 RTpWXNF38kcKpCHSQPuBRbGXqIsZz43lN8lGTfd2XFUojEPGwwH3ZSbsS
 J2eBZGFcKZ1K+Y8LrDi9hZh5PK2iaLajvZA3BNhC5hJMA4eMshwY61PiL
 s/ZLIZR9Bxep+OxYvO+RMopVcDaZt2cq0ou8aqjumt5Bp9kkzIvtowMMg
 GUfJ7LvfLJ19R2zX6IyfM+dzPhesYEpFKp/M1F9N3hTPWmUqIrgiP+LMF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256658691"
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; d="scan'208";a="256658691"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 23:19:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,273,1647327600"; d="scan'208";a="721633981"
Received: from nmoazzen-mobl2.amr.corp.intel.com (HELO [10.251.214.119])
 ([10.251.214.119])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 23:18:59 -0700
Message-ID: <a5599ebb-28cb-bf09-ffde-0079106bff9c@linux.intel.com>
Date: Fri, 3 Jun 2022 09:19:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [bug report] ASoC: SOF: ipc-msg-injector: Separate the message
 sending
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <Yph/sJtP/yMDuaEC@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Yph/sJtP/yMDuaEC@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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



On 02/06/2022 12:15, Dan Carpenter wrote:
> Hello Peter Ujfalusi,
> 
> The patch a9aa3381e404: "ASoC: SOF: ipc-msg-injector: Separate the
> message sending" from May 6, 2022, leads to the following Smatch
> static checker warning:
> 
> 	sound/soc/sof/sof-client-ipc-msg-injector.c:162 sof_msg_inject_dfs_write()
> 	warn: kernel error codes cast to unsigned 'size'
> 
> sound/soc/sof/sof-client-ipc-msg-injector.c
>     148 static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *buffer,
>     149                                         size_t count, loff_t *ppos)
>     150 {
>     151         struct sof_client_dev *cdev = file->private_data;
>     152         struct sof_msg_inject_priv *priv = cdev->data;
>     153         size_t size;
>     154         int ret;
>     155 
>     156         if (*ppos)
>     157                 return 0;
> 
> I think there needs to be an "if (count != priv->max_msg_size)" check
> or something.  Or another option would be the do a memset()

The interface is used to feed in crafted IPC messages to torture the
firmware (and in some level the kernel as well). How it will handle
deliberately ill crafted messages, what it will do if a valid but
unexpected message is sent, etc.

The only check I could think of is to prevent
less than sizeof(struct sof_ipc_cmd_hdr) count writes, but one could
argue that sending a normal header (u32 size, u32 cmd) followed by only
changing the size is also a valid shortcut.

> 
> 	memset(priv->tx_buffer, 0, priv->max_msg_size);
> 
> before the simple_write_to_buffer().  Otherwise if count == 1 then we
> re-use stale data.

If count is < sizeof(struct sof_ipc_cmd_hdr) to be precise, but even if
that passes there could be stale data in the buffer for message types
where there is extended payload.

Yes, there could be more size check, but the injector must not interpret
the message, it should not block invalid messages.

Let me think a bit on the minimum count check for a moment...

> 
>     158 
>     159         size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
>     160                                       ppos, buffer, count);
>     161         if (size != count)
> --> 162                 return size > 0 ? -EFAULT : size;
>     163 
>     164         memset(priv->rx_buffer, 0, priv->max_msg_size);
>     165 
>     166         ret = sof_msg_inject_send_message(cdev);
>     167 
>     168         /* return the error code if test failed */
>     169         if (ret < 0)
>     170                 size = ret;
>     171 
>     172         return size;
>     173 };
> 
> regards,
> dan carpenter

-- 
Péter
