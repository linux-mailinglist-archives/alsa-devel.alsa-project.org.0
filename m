Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A8E10E7AE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 10:31:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB39E1658;
	Mon,  2 Dec 2019 10:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB39E1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575279105;
	bh=mBY/BMR1Ch1CxqZWJTg35BkIzxZxTUGtVXgdABfNnso=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MKGXaW7qf6QMR06GVzm5v0y1CMWcEpymzos9H0eKAuMDmbcBTODAptIneGuXaWJDm
	 Miye308Hn0IiCbQ9Be6BsCZSzmbc8zaK1ahNaALzPXzRSz8pLDFLw/cPIMA3Twnl3+
	 uuLoWW2xo+1HyZCrJRJPncfVkxTpU59woLdmyvsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4E8F80214;
	Mon,  2 Dec 2019 10:30:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F6B6F80214; Mon,  2 Dec 2019 10:29:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 150E1F800F0
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 10:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 150E1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="nb7aZeFO"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB29T1Je005064;
 Mon, 2 Dec 2019 09:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=PTgvjzETagtLgHnhLzrl4n7RKdO+iUiL28eU2m4aAyw=;
 b=nb7aZeFOitP8GUCESSZGpTfAI6acxBxWWE5t0vNmh+MidiekP8GDOzVVEIjBq9u+lYju
 7zNmcWeuHiusdRR4NDz9zeT8Or+ahShcTK2668ujTOmpkuy7yi6KRxPas7Bb2ydG16ex
 M0JETX8Rz4G8eisCre6C2+29VghDVWkhWN/dtd7jxvspg+jc3A0ng5hDtMrzaXexAbOv
 waU0ExARD3Q+Ha86FRU7u4NN0jkTrKbuZDosxryasr1MEUo5HshI1LXDqKZw8wbYYqtD
 u3AjZazPilIwouxvL53nc+12V1kLcsrKfI0DBJzX0BCqRDSBqEBVDPZiFTxSuxkFn3yz nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2wkfutxq7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 09:29:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB29SdYk171048;
 Mon, 2 Dec 2019 09:29:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2wm1w23kgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Dec 2019 09:29:46 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB29Tfg5002021;
 Mon, 2 Dec 2019 09:29:45 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Dec 2019 01:29:40 -0800
Date: Mon, 2 Dec 2019 12:29:26 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: l.stach@pengutronix.de
Message-ID: <20191202092753.vmhb6l2d2pe7wwkk@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9458
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=908
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912020086
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9458
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=971 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912020086
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ASoC: tlv320aic31xx: configure output
 common-mode voltage
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

Hello Lucas Stach,

The patch e48fdb53bd1f: "ASoC: tlv320aic31xx: configure output
common-mode voltage" from Nov 18, 2019, leads to the following static
checker warning:

	sound/soc/codecs/tlv320aic31xx.c:1519 aic31xx_configure_ocmv()
	error: uninitialized symbol 'value'.

sound/soc/codecs/tlv320aic31xx.c
  1510  static void aic31xx_configure_ocmv(struct aic31xx_priv *priv)
  1511  {
  1512          struct device *dev = priv->dev;
  1513          int dvdd, avdd;
  1514          u32 value;
  1515  
  1516          if (dev->fwnode &&
  1517              fwnode_property_read_u32(dev->fwnode, "ai31xx-ocmv", &value)) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^
This test seems reversed.  If fwnode_property_read_u32() fails then
"value" can be uninitialized.

  1518                  /* OCMV setting is forced by DT */
  1519                  if (value <= 3) {
                            ^^^^^^^^^^

  1520                          priv->ocmv = value;
  1521                          return;
  1522                  }
  1523          }
  1524  
  1525          avdd = regulator_get_voltage(priv->supplies[3].consumer);
  1526          dvdd = regulator_get_voltage(priv->supplies[5].consumer);
  1527  

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
