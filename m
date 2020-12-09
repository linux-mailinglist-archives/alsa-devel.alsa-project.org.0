Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EE2D482F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 18:43:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128FA16B4;
	Wed,  9 Dec 2020 18:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128FA16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607535829;
	bh=bYhcpklMPvYM/l5PZOjyRHPfJlqyP5fZdxjrBpBJfM8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuPkI8Io8xjBqtZxbVRUwp5T+HKq/dTrHt52PRbOrxxhh7xcTToD9P9dZa4eqy63w
	 OCqRrc1AIPQjq8xkuj3UJIMLilX088SMFM6nJDOdszMkl9L3/9EY/0bka0JyYC0nAT
	 erQFXmzfkCv2Q7K4zTRu91cdLVpYg2MKC2Je45+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D02F80217;
	Wed,  9 Dec 2020 18:42:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59870F8020D; Wed,  9 Dec 2020 18:42:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B0CF800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 18:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B0CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="QHCUJ6gn"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HZM6v147302;
 Wed, 9 Dec 2020 17:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=v+L7MBl17moOPmAkw80EX6KWaouPxu2hSyVEcQDLGbc=;
 b=QHCUJ6gnlmJ7M99A1GZ+O/gTYBfYtqNx+/4fJ4wocWJIFCrwV2aufoO3TB3Czo5fubjv
 dJLlKVjk4xxYn6lazwSofDXP8N3BQF1YncDNDOvEYNuoVR3zhBNNm51MbiDrcQldeVOB
 3MbDanrlsm8Bu5WPBm80gt72Dd/bM1hAgHlW7WdvmeoZ1vNEBNT7cTW0/hASo+/dp/HC
 PXB+zRp13eOjTLcQucGzu4RN1OTYFSFNbXddfO0sGAEYYXc5sg+6zIbNxZ1kgr8bfW7E
 th9sd7HExs9bWPwUQQEfOp+z3WEhaequ9u9glzSz34Ekw0uJnk5rYZuSQkqjv+/QK2Gp vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35825m9fsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:41:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HYh3p183462;
 Wed, 9 Dec 2020 17:41:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 358kyv17b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:41:58 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HfurE026140;
 Wed, 9 Dec 2020 17:41:56 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:41:55 -0800
Date: Wed, 9 Dec 2020 20:41:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [bug report] ASoC: topology: fix endianness issues
Message-ID: <20201209174147.GH2789@kadam>
References: <X9B0eDcKy+9B6kZl@mwanda>
 <5d0d7992-49fa-21b4-d301-6456a11c13a9@linux.intel.com>
 <b98a6125-c1a6-31c1-578b-b5ce7dbf12dc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98a6125-c1a6-31c1-578b-b5ce7dbf12dc@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090124
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Ok...  Heh.  This is why I ask about this code instead of assuming that
ancient code with no known bug reports is broken.  Anyway, I'm
definitely not going to be the one to patch this because I am
intimidated now.  :P

regards,
dan carpenter


