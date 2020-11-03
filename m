Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3E2A44C7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 13:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9364851;
	Tue,  3 Nov 2020 13:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9364851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604405230;
	bh=HuV5JyqURzyKuPjARoXfFl6SEQ2D0dL+3BN4ajqRtBA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=okMwH7yglllItGeBgS2PsskaN0R+n0NU8LbOA4mo0a1NCSlLChHbg5WbnhgF5LpBm
	 H3/dxOxdfQeRx8N6kfSUUJMViWQsMfKpzY9a9BrD6AGdipnUFZl+V6DTj4WJcSPapS
	 t7JpDRYYWkA+1EtLjOIdVhtKV7TYfu2ZiahaURMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37911F80083;
	Tue,  3 Nov 2020 13:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37623F80171; Tue,  3 Nov 2020 13:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C2E1F8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 13:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2E1F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zyeS3smT"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3Bwtx7182068;
 Tue, 3 Nov 2020 12:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=q+wsy7r0fefR29tECZDwd1l9cMWzSmhdwklxTkHtt6s=;
 b=zyeS3smTk3VZuX+TFPpFJjuqYHx5BNKhFVVCdTUDvE/JaSdKpC7Wqb5Bu1V00fETxTMW
 x8Qr67KBxHEk3jmouYTnLYjCWAGoH4PE2X0opwKv+seSlAnEudZHdfpqpd3WU53PEDWU
 jAZgvsKMfP27jt3uuawlncKP4bYHJNW+HPqIwzhgN82b9fIeFPYBryR5zsqVX/Nqh4LJ
 muyQmQLnZWXjGjTcT/kudyiwuVz5mAHTTxM/wfbqGRs4tR49XC3/X4XQqPIVKCdF9HVs
 JlAzHSbEgODk+vaOsRfs6tWwh4sQBXpNrc1B0WhwGcm13gc5C8QAasfGMcZmcBNV+g2R OA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 34hhw2gv8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 03 Nov 2020 12:05:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3C0o6W110262;
 Tue, 3 Nov 2020 12:03:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34jf48beqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 12:03:24 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A3C3IRp007609;
 Tue, 3 Nov 2020 12:03:22 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Nov 2020 04:03:17 -0800
Date: Tue, 3 Nov 2020 15:03:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Yu Hao <yuhaobehappy@gmail.com>, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [kbuild] Re: [PATCH] sound/core/seq: remove dead code
Message-ID: <20201103120310.GD18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102071154.23563-1-yuhaobehappy@gmail.com>
Message-ID-Hash: DMOKRFFXA6ZFDA2QVKS2J7Q73UCF6SHH
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030083
Cc: yuhaobehappy@gmail.com, kbuild-all@lists.01.org, lkp@intel.com,
 linux-kernel@vger.kernel.org
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

Hi Yu,

url:    https://github.com/0day-ci/linux/commits/Yu-Hao/sound-core-seq-remove-dead-code/20201102-152326 
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git  for-next
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/core/seq/seq_queue.c:545:16: warning: Unused variable: flags [unusedVariable]
    unsigned long flags;
                  ^

vim +545 sound/core/seq/seq_queue.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  543  void snd_seq_queue_client_termination(int client)
^1da177e4c3f415 Linus Torvalds 2005-04-16  544  {
^1da177e4c3f415 Linus Torvalds 2005-04-16 @545  	unsigned long flags;
                                                        ^^^^^^^^^^^^^^^^^^^
Unused.

^1da177e4c3f415 Linus Torvalds 2005-04-16  546  	int i;
c7e0b5bf9fff1b7 Takashi Iwai   2005-11-17  547  	struct snd_seq_queue *q;
^1da177e4c3f415 Linus Torvalds 2005-04-16  548  
^1da177e4c3f415 Linus Torvalds 2005-04-16  549  	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  550  		if ((q = queueptr(i)) == NULL)
^1da177e4c3f415 Linus Torvalds 2005-04-16  551  			continue;
^1da177e4c3f415 Linus Torvalds 2005-04-16  552  		queuefree(q);
^1da177e4c3f415 Linus Torvalds 2005-04-16  553  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  554  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
