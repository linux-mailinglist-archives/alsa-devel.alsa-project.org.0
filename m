Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1B9CE93
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 13:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9A641682;
	Mon, 26 Aug 2019 13:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9A641682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566820254;
	bh=AzU68kJHyLArKmauhrlPUT5r2dBgKhZCOV37QYttI8E=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JsBZQfAsjbxtaiTqohwNnaWM93+4VE/aVX3kOp7cf6Iu9jIj6djegW7agTJcwKRrd
	 O1G09y0pIaqe6fnPtPaWkVOobEN6JAIzE8s+FTGSzk2icvOxxHVDEkHPiJmmBNhiK3
	 wJnx57o/Y3zaILuBlo5Svox9fCsRClS65vwIa+SE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F3AAF80377;
	Mon, 26 Aug 2019 13:49:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 917DAF80362; Mon, 26 Aug 2019 13:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=BIGNUM_EMAILS, DKIMWL_WL_HIGH, 
 DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, SPF_HELO_PASS, SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D482FF80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 13:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D482FF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Uw/e4MNO"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QBiO3d052275;
 Mon, 26 Aug 2019 11:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=MyEd1p8E/ZdZBAx/gEyqRZ4kV1wY544NsvJWad55bvs=;
 b=Uw/e4MNOsQCFJykIaLBlHuR03Zd7tNqXj963usfPcnCbLTrx8WpegD5kmC3gvgaoghvE
 PU+Jq8tvJc+HmMtuTOEl/WVWZxkhnLX7+Ed9Uo7RLELPOSltAIncGpv0qDYMTOJUn+/F
 W2Vx2wOXsE/C1Y1W5poR4Z1lGCXC16xrmsrl3/ONu5alLFdQ8a4yokmDu9gLGJ3kIp6H
 FG49v6D4bRUtoEK7KhcQeCVa2/UvrOqC2rb6CyKpe2cbJkloxAgg/ZuvKE2azNu1XDSH
 CrePsrP4Jcp5XBtWNtkMTGqzFPcGBSV1hJLS4ha67JIbVfkfi5pz8iXDova3RlMrK9OU 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2ujw700hwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 11:49:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QBmFh3002846;
 Mon, 26 Aug 2019 11:48:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2ujw79f2eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 11:48:59 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7QBmqj7016436;
 Mon, 26 Aug 2019 11:48:58 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Aug 2019 04:48:51 -0700
Date: Mon, 26 Aug 2019 14:48:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Message-ID: <20190826114846.GA16466@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=546
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=605 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260132
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ALSA: usb-audio: More validations of
	descriptor units
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

Hello Takashi Iwai,

This is a semi-automatic email about new static checker warnings.

The patch 57f8770620e9: "ALSA: usb-audio: More validations of
descriptor units" from Aug 20, 2019, leads to the following Smatch
complaint:

    sound/usb/quirks.c:254 create_yamaha_midi_quirk()
    warn: variable dereferenced before check 'injd' (see line 251)

sound/usb/quirks.c
   244          /* must have some valid jack descriptors */
   245          injd = snd_usb_find_csint_desc(alts->extra, alts->extralen,
   246                                         NULL, USB_MS_MIDI_IN_JACK);
   247          outjd = snd_usb_find_csint_desc(alts->extra, alts->extralen,
   248                                          NULL, USB_MS_MIDI_OUT_JACK);
   249          if (!injd && !outjd)
                     ^^^^^^^^^^^^^
At least one must be valid.

   250                  return -ENODEV;
   250			return -ENODEV;
   251		if (!snd_usb_validate_midi_desc(injd) ||
   252		    !snd_usb_validate_midi_desc(outjd))

So this should return true/valid if the pointer is NULL?

   253			return -ENODEV;
   254		if (injd && (injd->bLength < 5 ||
   255			     (injd->bJackType != USB_MS_EMBEDDED &&
   256			      injd->bJackType != USB_MS_EXTERNAL)))

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
