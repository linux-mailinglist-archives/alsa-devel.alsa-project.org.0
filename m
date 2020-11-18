Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A422B7E99
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 14:54:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EF32172F;
	Wed, 18 Nov 2020 14:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EF32172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605707648;
	bh=5KyOBGU8W8/BPsw6pDYAD7n0q+dqRcWEa1oJgCDz0J8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JI1iXuawW1/6N1V5ZFJdxlSGOM/SedAkQ/3NCF6kzgU9jGPb/7TXhPH1imwCn5Z16
	 YsLQ5P2RIS7M/LrjJUIWqf+7Ra6Xfn3/HaKjwkED/yNp3/b96BQGYSi17zw7f4E/E7
	 is9MF5wQ8YoFBVSH7LZPj2m1AO14Z6MKAc87mYf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A841F800EE;
	Wed, 18 Nov 2020 14:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B50E6F8016C; Wed, 18 Nov 2020 14:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91AE1F80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AE1F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="MptJc0p8"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIDihq0188810;
 Wed, 18 Nov 2020 13:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=oPsufWA6wCykvEAj9O3oIE2DHb3hTg/M+D1ozbYIPpA=;
 b=MptJc0p8AVA59pfpDqU69eavas2BAWMmhQy7DAz5kscQDVM36cNIItnTSddP51CiTZN4
 D6pUpYGdofsd4Ay/UgkAsUGKRGHH5k1nUwtBHTssvTUq/PaFaAAw9h8C9oD5c8MwmOZK
 NgwB1Rs4gyo07UFAseJbLlIarPvQbJpLaQjMwGW6t2YAtQmBig5JhVQOYjQDWMk2Q2J9
 czFCgGGajUL0FKlEUCohQPlVbix3mq8mHIm8qWYasoHFuw5LIbqD576V4D7LefqK02NO
 GafALugrs1b3wdz3KJWQZY4qLMYy4HidZMN2S1WcF4apimukPaMoSOSE9MfxKMf6dZHU SQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34t4rb07mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 13:52:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIDoYrL025384;
 Wed, 18 Nov 2020 13:52:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34ts5xhne1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 13:52:23 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AIDqIUE018372;
 Wed, 18 Nov 2020 13:52:22 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 05:52:18 -0800
Date: Wed, 18 Nov 2020 16:52:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: mixart: Use nonatomic PCM ops
Message-ID: <20201118135212.GA373539@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=3 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=902
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1011
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=916 adultscore=0 phishscore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180097
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

[ This bug predates git but my email script just uses `git blame -w`.
  -dan ]

Hello Takashi Iwai,

The patch 8d3a8b5cb57d: "ALSA: mixart: Use nonatomic PCM ops" from
Sep 10, 2014, leads to the following static checker warning:

	sound/pci/mixart/mixart_core.c:73 get_msg()
	warn: called with lock held.  '&mgr->msg_lock'

sound/pci/mixart/mixart_core.c
    63  static int get_msg(struct mixart_mgr *mgr, struct mixart_msg *resp,
    64                     u32 msg_frame_address )
    65  {
    66          u32  headptr;
    67          u32  size;
    68          int  err;
    69  #ifndef __BIG_ENDIAN
    70          unsigned int i;
    71  #endif
    72  
    73          mutex_lock(&mgr->msg_lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch says that get_msg() is called with this lock already held.

    74          err = 0;
    75  
    76          /* copy message descriptor from miXart to driver */
    77          size                =  readl_be(MIXART_MEM(mgr, msg_frame_address));       /* size of descriptor + response */
    78          resp->message_id    =  readl_be(MIXART_MEM(mgr, msg_frame_address + 4));   /* dwMessageID */


[ snip ]

   419  irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
   420  {
   421          struct mixart_mgr *mgr = dev_id;
   422          int err;
   423          struct mixart_msg resp;
   424          u32 msg;
   425  
   426          mutex_lock(&mgr->lock);
                ^^^^^^^^^^^^^^^^^^^^^^
We are holding the lock

   427          /* process interrupt */
   428          while (retrieve_msg_frame(mgr, &msg)) {
   429  
   430                  switch (msg & MSG_TYPE_MASK) {
   431                  case MSG_TYPE_COMMAND:
   432                          resp.message_id = 0;
   433                          resp.data = mixart_msg_data;
   434                          resp.size = sizeof(mixart_msg_data);
   435                          err = get_msg(mgr, &resp, msg & ~MSG_TYPE_MASK);
                                      ^^^^^^^^^^^
When get_msg() is called on this path.

   436                          if( err < 0 ) {
   437                                  dev_err(&mgr->pci->dev,
   438                                          "interrupt: error(%d) reading mf %x\n",
   439                                          err, msg);
   440                                  break;
   441                          }
   442  
   443                          if(resp.message_id == MSG_SERVICES_TIMER_NOTIFY) {

regards,
dan carpenter
