Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E74B618
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 12:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308631696;
	Wed, 19 Jun 2019 12:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308631696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560939528;
	bh=hTka7Xf1CcNoh0bnU+2KV+f2AQKc/C7MZIeESlDUF6Q=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bxu0MA+P/a1exdc27tLJyv0tyq9TYszXgc1jVCON0pfiN2aLWFMUcF1lz8TG5ZwQ8
	 LsFlqm5BlN48JRUhuNFvJBOdhrTtNzi6WAm/3UWE6cf56LK5R+nkTPCte/YO5riYJF
	 Ug0cJLAZGv0MOD3lzKWALdAF8BMBiCgYCZhoXBiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59CCCF896DA;
	Wed, 19 Jun 2019 12:17:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A3ABF808AF; Wed, 19 Jun 2019 12:17:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65184F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 12:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65184F808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="N57rDeD2"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JADdpZ118372;
 Wed, 19 Jun 2019 10:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=mlN2fia6+oTMJF+VyMap8vYkjN7v5a2tADdEhy4orJ4=;
 b=N57rDeD2yzMs/l8t0y5CrZBomcKHw1TCbsY+OLCyXaJdLQqe7C/7BRyBx4F3rXqan4RO
 s37Aq1X+q4cPSkUYgDernpuPRUMTK0HDFgV9kjFBEaQU0PaqCVSNZ6EPwSmxrtrTwFlw
 nS98AnVha09Mv+5UylJyFgfeEXe9/1byCWpbXBvgD1coLc882IyvqwBlUT5XyzW8zJrG
 jmcvf2Nli7VuLwW+CiYfDgc38OfIwnu8y8B1xHkSTLc0CbsTCCjetrQvlXPtf96GRwVj
 NjWTciaAi+yGdyywhZWP3mDr9Ej5OKr2VEp7wgUogxnyAx8L3sByxE/fq1e5x7YqPWCi VQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2t7809ag9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 10:16:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JAGUOY114205;
 Wed, 19 Jun 2019 10:16:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t77ynrjav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 10:16:54 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5JAGrQA017642;
 Wed, 19 Jun 2019 10:16:53 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 03:16:52 -0700
Date: Wed, 19 Jun 2019 13:16:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: o-takashi@sakamocchi.jp
Message-ID: <20190619101639.GA29913@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190085
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ALSA: oxfw: configure packet format in
 pcm.hw_params callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Takashi Sakamoto,

The patch 4f380d007052: "ALSA: oxfw: configure packet format in
pcm.hw_params callback" from Jun 12, 2019, leads to the following
static checker warning:

	sound/firewire/oxfw/oxfw-stream.c:357 snd_oxfw_stream_start_duplex()
	warn: 'oxfw->rx_stream.buffer.packets' double freed

sound/firewire/oxfw/oxfw-stream.c
   317  int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
   318  {
   319          int err;
   320  
   321          if (oxfw->substreams_count == 0)
   322                  return -EIO;
   323  
   324          if (amdtp_streaming_error(&oxfw->rx_stream) ||
   325              amdtp_streaming_error(&oxfw->tx_stream)) {
   326                  amdtp_stream_stop(&oxfw->rx_stream);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   327                  cmp_connection_break(&oxfw->in_conn);
   328  
   329                  if (oxfw->has_output) {
   330                          amdtp_stream_stop(&oxfw->tx_stream);
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   331                          cmp_connection_break(&oxfw->out_conn);
   332                  }
   333          }
   334  
   335          if (!amdtp_stream_running(&oxfw->rx_stream)) {
   336                  err = start_stream(oxfw, &oxfw->rx_stream);
   337                  if (err < 0) {
   338                          dev_err(&oxfw->unit->device,
   339                                  "fail to start rx stream: %d\n", err);
   340                          goto error;
   341                  }
   342          }
   343  
   344          if (oxfw->has_output) {
   345                  if (!amdtp_stream_running(&oxfw->tx_stream)) {
   346                          err = start_stream(oxfw, &oxfw->tx_stream);
   347                          if (err < 0) {
   348                                  dev_err(&oxfw->unit->device,
   349                                          "fail to start tx stream: %d\n", err);
   350                                  goto error;
   351                          }
   352                  }
   353          }
   354  
   355          return 0;
   356  error:
   357          amdtp_stream_stop(&oxfw->rx_stream);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Smatch is basically complaining that we call amdtp_stream_stop() and
it's not clear that we necessarily reset things.  I don't know this code
very well so I have maybe missed something.

   358          cmp_connection_break(&oxfw->in_conn);
   359          if (oxfw->has_output) {
   360                  amdtp_stream_stop(&oxfw->tx_stream);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   361                  cmp_connection_break(&oxfw->out_conn);
   362          }
   363          return err;
   364  }

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
