Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F61295180
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 19:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE8731793;
	Wed, 21 Oct 2020 19:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE8731793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603301371;
	bh=usR4iMwbOO8Lw39tNt3i/Y0ZeHSlEOtWsmtMOT2ku14=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pf8NO27waMlnUYLBr+l0XEarBvqBMfT/4EwabElGKfoRawMsmD/lyp7Pi6MvBgRpG
	 JfAoftYhB/cCHLKcVgreF9Jk5gR5S8ey8wwCbPxGXwYw+e9Vg+ySNXr4neHRGb44EC
	 oHl9Yn84HKnF+NluGNSb46wUA8Cbf+GiyFiXv+sA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F3CF80247;
	Wed, 21 Oct 2020 19:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60EB9F80264; Wed, 21 Oct 2020 19:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43E2F8011C
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 19:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43E2F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="q1gHTce4"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LHP3uG167825;
 Wed, 21 Oct 2020 17:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=PvpMQvqUPu688atIgpYzTtfHWZOzWoK/w9kO5bfVFqw=;
 b=q1gHTce446Ea+DF9zMZGj3xwZviRfarwHKmU2u8PAt9fuHEL72GBRAO7oVMgVvmxbk1E
 weudH/DxVY5gxMYI3wRPqhthzFNAwg/yGhGlzr5hVUZ1GMYWQUbkSXVtiH7MFz3iC/3Y
 Smz1pKT9hA8dxAUk8BkdLKimADi9mfSiadcKDrfUqCyVVE10kQz+IOBfbriY7ZXYXJQJ
 QxrunhmOAcQfnC+mIv6crvtncK1/7k6UrDGcjM3wGHxbOZjhq6Wqy1Zp3XI56l5MK+I7
 p7bxOcnAj0+To+tZvE+sNE/3Asr9goSwNPEorkpXfVom5BZuA7P2JsvV0S82T2fziGSF 0A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 349jrpswux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 17:27:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LHOxvE091136;
 Wed, 21 Oct 2020 17:27:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 348ahxu88y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 17:27:40 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09LHRZQJ017536;
 Wed, 21 Oct 2020 17:27:39 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 10:27:34 -0700
Date: Wed, 21 Oct 2020 20:27:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [bug report] ALSA: hda - Don't register a cb func if it is
 registered already
Message-ID: <20201021172728.GY18329@kadam>
References: <20201021121904.GA1126544@mwanda>
 <da806361-d1a8-ce20-462f-0ec6acff5bfc@canonical.com>
 <9be5bc31-0118-1542-560f-cfe2cecf2403@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9be5bc31-0118-1542-560f-cfe2cecf2403@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210126
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

On Wed, Oct 21, 2020 at 11:03:11PM +0800, Hui Wang wrote:
> Looks like this will not bring problem on patch_sigmatel.c, NULL and valid
> kernel pointer are same for IS_ERR(), they will not make IS_ERR() come true.
> 

Correct, but that is the problem.  You can dereference a valid pointer
but you can't dereference a NULL.

> On 10/21/20 10:21 PM, Hui Wang wrote:
> > 
> > On 10/21/20 8:19 PM, Dan Carpenter wrote:
> > > Hello Hui Wang,
> > > 
> > > The patch f4794c6064a8: "ALSA: hda - Don't register a cb func if it
> > > is registered already" from Sep 30, 2020, leads to the following
> > > static checker warning:
> > > 
> > >     sound/pci/hda/patch_sigmatel.c:3075 stac92hd71bxx_fixup_hp_m4()
> > >     warn: 'jack' can also be NULL
> > > 
> > > sound/pci/hda/patch_sigmatel.c
> > >    3069          /* Enable VREF power saving on GPIO1 detect */
> > >    3070          snd_hda_codec_write_cache(codec, codec->core.afg, 0,
> > >    3071 AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x02);
> > >    3072          jack = snd_hda_jack_detect_enable_callback(codec,
> > > codec->core.afg,
> > >    3073 stac_vref_event);
> > > 
> > > Originally snd_hda_jack_detect_enable_callback() would not return NULL
> > > here.
> > > 
> > >    3074          if (!IS_ERR(jack))
> > >    3075                  jack->private_data = 0x02;

So if "jack" is NULL then it will say it's not an error pointer so it
will try to assign jack->private_data = 0x02; and oops.

regards,
dan carpenter

