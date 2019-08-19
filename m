Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ECD922B5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 13:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C415166A;
	Mon, 19 Aug 2019 13:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C415166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566215261;
	bh=47ia9Cewv3ouW6ZiU7cEAWbGv64dhrFAsPv9D4QeGoI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JSMiGRp2Zk5aOE6x3854SeYvCWk85Ftlorj7FblMdoOUcVd7cikxcelkccZh6Ct7R
	 toKhKY/rFB/TDtzN+HGpgmTmAMq31TFnnjfyamBgzHhScLSR+rxbzi8BsTkbOSNtv+
	 7AJStePxTRuF8sqY2FUhtqw1CK5wtuNMwFRWT7TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32BFF800B6;
	Mon, 19 Aug 2019 13:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3064F802E0; Mon, 19 Aug 2019 13:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=BIGNUM_EMAILS, DKIMWL_WL_HIGH, 
 DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU, SPF_HELO_PASS, SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7E05F800B6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 13:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E05F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="BanBGMUc"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JBiJxT026548;
 Mon, 19 Aug 2019 11:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=25v2e5Q/acykug8iJZTZiMy3h+EkO2B82m9zJvCwfOA=;
 b=BanBGMUcjioFeAmaqliNunEHPp26j0xWtgRAgFmo6bC/YkVtJ8GFg1aBGYgklU26yIKp
 2JmAzEmbvheKw6EKk+HJs2PTPH8a2ldh5KBTntejglO3tr9BESW8JNoWGVcMGCklSAk9
 YqyRekMrROZOTr+jmnCajEAz8clRYVUpysRnSFGJSRVluJr3SabXZZUS7EHt6f33or0G
 o3dbzrpR154WnvXEaN1ndTRW8cDEJ2KWx2nNn+AVh1cRpW65BswrQKl0wco5SdOaiKJs
 emi74l6tQJfGHGuygfASqYdR1hYg91RXt2Wfc3aDFZwjFrJA9JitbFvKP9hiz/5hUn4p CA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2ue9hp6w0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 11:45:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JBhrdm096838;
 Mon, 19 Aug 2019 11:45:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ue6qeepnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 11:45:45 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7JBjfSf007005;
 Mon, 19 Aug 2019 11:45:44 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Aug 2019 04:45:41 -0700
Date: Mon, 19 Aug 2019 14:45:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jaska.uimonen@intel.com
Message-ID: <20190819114535.GA24323@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=826
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908190135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=876 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908190135
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [bug report] ASoC: SOF: topology: use set_get_data in
	process load
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

Hello Jaska Uimonen,

The patch cac974a51ebb: "ASoC: SOF: topology: use set_get_data in
process load" from Aug 9, 2019, leads to the following static checker
warning:

	sound/soc/sof/topology.c:1857 sof_process_load()
	warn: 'ipc_data_size' unsigned <= 0

sound/soc/sof/topology.c
  1825  static int sof_process_load(struct snd_soc_component *scomp, int index,
  1826                              struct snd_sof_widget *swidget,
  1827                              struct snd_soc_tplg_dapm_widget *tw,
  1828                              struct sof_ipc_comp_reply *r,
  1829                              int type)
  1830  {
  1831          struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
  1832          struct snd_soc_dapm_widget *widget = swidget->widget;
  1833          struct snd_soc_tplg_private *private = &tw->priv;
  1834          struct sof_ipc_comp_process *process = NULL;
  1835          struct sof_widget_data *wdata = NULL;
  1836          size_t ipc_data_size = 0;
                ^^^^^^^^^^^^^^^^^^^^
Unsigned.

  1837          size_t ipc_size;
  1838          int offset = 0;
  1839          int ret = 0;
  1840          int i;
  1841  
  1842          if (type == SOF_COMP_NONE) {
  1843                  dev_err(sdev->dev, "error: invalid process comp type %d\n",
  1844                          type);
  1845                  return -EINVAL;
  1846          }
  1847  
  1848          /* allocate struct for widget control data sizes and types */
  1849          if (widget->num_kcontrols) {
  1850                  wdata = kcalloc(widget->num_kcontrols,
  1851                                  sizeof(*wdata),
  1852                                  GFP_KERNEL);
  1853  
  1854                  if (!wdata)
  1855                          return -ENOMEM;
  1856  
  1857                  /* get possible component controls and get size of all pdata */
  1858                  ipc_data_size = sof_get_control_data(sdev, widget, wdata);
  1859  
  1860                  if (ipc_data_size <= 0) {


The sof_get_control_data() returns negative error codes, but it's also
declared as unsigned.  But the main reason I'm reporting this instead of
fixing it myself (besides laziness) is that I was wondering if it was
really handling zero returns correctly.  Should we really return success
in that situation?

  1861                          ret = ipc_data_size;
  1862                          goto out;
  1863                  }
  1864          }
  1865  

regards,
dan carpenter
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
