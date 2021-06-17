Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF63AB482
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 15:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E884216F0;
	Thu, 17 Jun 2021 15:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E884216F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623935993;
	bh=ytMKzOBvftrLCuUm7PvWgWqf9K9f5M16Qb5pm52evHc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NWtCZGRo0hMLqGxPZlhdm4u+f/nPurpXqRbmPZVO78T7qkVftdUfeODlvVXrLiE+1
	 5/EtrzPNPfwz8aLcWdpU/jRoNAGuWf7PAuk/rxTebEq2xiIs7UN1hPjnftBLx1D42c
	 nl0gTu7/C4tuHs+LujPpJrCpOtYuX3Wlpq2o145k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E8CF8016D;
	Thu, 17 Jun 2021 15:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E85F4F8016D; Thu, 17 Jun 2021 15:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBD91F80171
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 15:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBD91F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="h14CE6VT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HDGcJ0016842; Thu, 17 Jun 2021 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=DaZa/IZYjp0s4ELpBwApZUYbKUYB5n5LiRdUaw+W3uw=;
 b=h14CE6VTzwkP53gj3nwfghwbHDNSZQp2yUMGmjAPhoj56yf3K6v8j16x/umKnRruIr9A
 Fu6T6dMh78urn2frZKNzAJjx0T9pQLpY6nFj5DsTioXuZOZb4DyvTfo8Fe2R+zXcj12d
 oZ7SSAwwGqciPemvCAjg2aoE+00aZD30C/GVxlNcKluLpt1B/ANGojMStez3kD2PyAw3
 pT4b8U7Fz/sWzXFRE5UdyIxGzAzQFYnzY1kIdfDT8m4HtbOhAjMyU5xwF/vNnns7TNkV
 PKYWahJTnRjE8JPgebZNvshddLR5ju/Tk1ffZJ0C373AOtEhogY0eN+aGAV7JfAElg3a oQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 396tr0vhtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:18:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDFL0B076010;
 Thu, 17 Jun 2021 13:18:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 396wavkhfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:18:14 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDIDti083145;
 Thu, 17 Jun 2021 13:18:13 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 396wavkhey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:18:13 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15HDIAqK012654;
 Thu, 17 Jun 2021 13:18:13 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Jun 2021 06:18:10 -0700
Date: Thu, 17 Jun 2021 16:18:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: seq: Fix assignment in if condition
Message-ID: <YMtLi0qCOc00eEcF@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: wPSNpvhzX32gDBPUFY2FHbDf92jxYtJL
X-Proofpoint-ORIG-GUID: wPSNpvhzX32gDBPUFY2FHbDf92jxYtJL
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

Hello Takashi Iwai,

The patch f9a6bb841f73: "ALSA: seq: Fix assignment in if condition"
from Jun 8, 2021, leads to the following static checker warning:

	sound/core/seq/oss/seq_oss_init.c:99 snd_seq_oss_create_client()
	warn: 'port->addr.port' is unsigned

sound/core/seq/oss/seq_oss_init.c
    82  
    83          /* create annoucement receiver port */
    84          memset(port, 0, sizeof(*port));
    85          strcpy(port->name, "Receiver");
    86          port->addr.client = system_client;
    87          port->capability = SNDRV_SEQ_PORT_CAP_WRITE; /* receive only */
    88          port->type = 0;
    89  
    90          memset(&port_callback, 0, sizeof(port_callback));
    91          /* don't set port_callback.owner here. otherwise the module counter
    92           * is incremented and we can no longer release the module..
    93           */
    94          port_callback.event_input = receive_announce;
    95          port->kernel = &port_callback;
    96          
    97          call_ctl(SNDRV_SEQ_IOCTL_CREATE_PORT, port);
    98          system_port = port->addr.port;
    99          if (system_port >= 0) {
                    ^^^^^^^^^^^^^^^^
This was from the old code.  It's not clear what is going on.  I think
the condition can be deleted.

   100                  struct snd_seq_port_subscribe subs;
   101  
   102                  memset(&subs, 0, sizeof(subs));
   103                  subs.sender.client = SNDRV_SEQ_CLIENT_SYSTEM;
   104                  subs.sender.port = SNDRV_SEQ_PORT_SYSTEM_ANNOUNCE;
   105                  subs.dest.client = system_client;
   106                  subs.dest.port = system_port;
   107                  call_ctl(SNDRV_SEQ_IOCTL_SUBSCRIBE_PORT, &subs);
   108          }
   109          rc = 0;
   110  
   111          /* look up midi devices */
   112          schedule_work(&async_lookup_work);
   113  
   114   __error:
   115          kfree(port);
   116          return rc;
   117  }

regards,
dan carpenter
