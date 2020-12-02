Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 921882CC553
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 19:39:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1210E17D7;
	Wed,  2 Dec 2020 19:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1210E17D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606934395;
	bh=lG7vcRslsPO6RTqOGHw4q33MVVPzATNlZ8eoMZI13VA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ElFrC4paQsim0msZx2ndeCGOR0s+riCvD/o/tAQxGvOH1mymgZ3MIgkaHBU9qNqYh
	 oO8EkPoZVx50B7rSR7ifjthPEyY8yMbPWxxboQIc3sBnH6HkwQCFBJBUt1Irp/CdH/
	 9K5F/sHvwK63Szqs8LgRi9jENb62NfGDMSr5KHRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D26FF80082;
	Wed,  2 Dec 2020 19:38:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA1EFF8026B; Wed,  2 Dec 2020 19:38:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D84A4F80082
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 19:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D84A4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="lyhZESRf"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2ITCEW139287;
 Wed, 2 Dec 2020 18:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=EtihPShjuCPJjG5edj4pxu0NLVh0gWdqqyzMNCOLYHk=;
 b=lyhZESRfP5E9bQyJuecnCJsPLjdEsSovuo/9IE5AVbxXAoIUhuqKE50bWfCfZloO3JEB
 UjMHI/A16xG/J7Q8jPQwjHVOx3ozorbzLDm+KkFL//P1KKqrvl/mt9VLwfDVXB1ogr99
 wA0SxBzJvYee7tmrcc4tEbMr28O3VI2t+UFbKbNV6jrYMkBoa1aCk9E4U+/SKJnt60nf
 nFANZOBNIBsoMlzsKjfYYdM1loGvtdXRgInoNAapXJbqpYSJxs3sQWF6Zq3NrH+H7mpR
 /zsKOZOfpkx8CkWUcyRdAMAM5VJqeHUkbJvYt6LRSrLDBs0MtJNcj9WOYfPX0I/k4gjj Aw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 353egkt0y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 02 Dec 2020 18:38:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B2Ic28Q152300;
 Wed, 2 Dec 2020 18:38:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3540auqa8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Dec 2020 18:38:06 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B2IbkS1026781;
 Wed, 2 Dec 2020 18:37:46 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Dec 2020 10:37:46 -0800
Date: Wed, 2 Dec 2020 21:37:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-ID: <20201202183739.GP2767@kadam>
References: <X8c5gjZO7YN/CFsq@mwanda>
 <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012020109
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

On Wed, Dec 02, 2020 at 03:54:53PM +0000, Srinivas Kandagatla wrote:
> Thanks Dan for the patch!
> 
> Do you use any tools to do this checks?
> 

Yeah.  This was a Smatch warning:

sound/soc/codecs/lpass-va-macro.c:847 va_macro_hw_params() warn: always true condition '(decimator >= 0) => (0-u32max >= 0)'

But every static checker will complain about these.

regards,
dan carpenter

