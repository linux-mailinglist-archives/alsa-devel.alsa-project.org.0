Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7DB388951
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 10:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07941655;
	Wed, 19 May 2021 10:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07941655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621412671;
	bh=PR6ek7i6I6Gv1TZbTJZh3ZsHGjrc17SBus4xSNjxAM4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hf6yE800rl5S3B8igPR/SboLjqwXbuwRl8otrOdEFIKnJyI6WbGEVMrOXyReUOzHw
	 IpgFl0F3yK0obdRyx8nfgr+DDb/Mjjanr/G80bVoCxiu3bOrb58sXA/mVehrTGjVnS
	 z6sTQZUO+G/gftPzaRWBaJo/pJ8xhMUhOb1tfDYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E66F8014C;
	Wed, 19 May 2021 10:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D90FF8016E; Wed, 19 May 2021 10:23:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 039FBF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 10:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039FBF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="OmYqo5W0"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14J8J1uU164435;
 Wed, 19 May 2021 08:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=32746IanmvM+l0a/qQxnC90+/wGiZI+eFEiKP0FGIOo=;
 b=OmYqo5W0I+/9gZzR08znZBA8bI/21SJ4dRBL3/iiBfaEqv744p0NSfSZtQjm2M9A71m7
 Gvb+DjzQ5Ip0+MK9+gSBIKZjtASXtWJWy8Os2q9muuwjDVZyYIbX5u4lAFNKjtQFYgIp
 FyR2Gf++GFlxkvX9G/7Sq+1xEHWnAezsP1avHPHOrT7VAIQqOH0PpyJ4tBs/XS6sO/2z
 +T0qpAwPz9MgC5dD+OXrY1u+VZj4ADJPCoDcrSNLcD4kyggX4aIJbiF1YiJwwVwlXkF/
 1UetQN8psHrqAqUXrVeQRORKBeB23o3Hp94oQD8xS3xSBYJPaNpiwt2gfz6nDREuhzlq xA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 38j5qr8qh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 08:22:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14J8L8Fe037902;
 Wed, 19 May 2021 08:22:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38meefx401-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 08:22:44 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14J8MhhY039619;
 Wed, 19 May 2021 08:22:43 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38meefx3yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 08:22:43 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14J8MdGb012336;
 Wed, 19 May 2021 08:22:43 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 01:22:38 -0700
Date: Wed, 19 May 2021 11:22:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jaska.uimonen@linux.intel.com
Subject: [bug report] ASoC: topology: Add support for multiple kcontrol types
 to a widget
Message-ID: <YKTKyZjzVFjgzZtE@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: EPvS5JVQaSUhOD8-fpMUs0fImMl6VVBv
X-Proofpoint-ORIG-GUID: EPvS5JVQaSUhOD8-fpMUs0fImMl6VVBv
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 impostorscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190062
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

Hello Jaska Uimonen,

The patch d29d41e28eea: "ASoC: topology: Add support for multiple
kcontrol types to a widget" from May 7, 2021, leads to the following
static checker warning:

	sound/soc/soc-topology.c:1559 soc_tplg_dapm_widget_create()
	error: uninitialized symbol 'kcontrol_type'.

sound/soc/soc-topology.c
  1418  static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
  1419          struct snd_soc_tplg_dapm_widget *w)
  1420  {
  1421          struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
  1422          struct snd_soc_dapm_widget template, *widget;
  1423          struct snd_soc_tplg_ctl_hdr *control_hdr;
  1424          struct snd_soc_card *card = tplg->comp->card;
  1425          unsigned int *kcontrol_type;
  1426          struct snd_kcontrol_new *kc;
  1427          int mixer_count = 0;
  1428          int bytes_count = 0;
  1429          int enum_count = 0;
  1430          int ret = 0;
  1431          int i;
  1432  
  1433          if (strnlen(w->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
  1434                  SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1435                  return -EINVAL;
  1436          if (strnlen(w->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
  1437                  SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
  1438                  return -EINVAL;
  1439  
  1440          dev_dbg(tplg->dev, "ASoC: creating DAPM widget %s id %d\n",
  1441                  w->name, w->id);
  1442  
  1443          memset(&template, 0, sizeof(template));
  1444  
  1445          /* map user to kernel widget ID */
  1446          template.id = get_widget_id(le32_to_cpu(w->id));
  1447          if ((int)template.id < 0)
  1448                  return template.id;
  1449  
  1450          /* strings are allocated here, but used and freed by the widget */
  1451          template.name = kstrdup(w->name, GFP_KERNEL);
  1452          if (!template.name)
  1453                  return -ENOMEM;
  1454          template.sname = kstrdup(w->sname, GFP_KERNEL);
  1455          if (!template.sname) {
  1456                  ret = -ENOMEM;
  1457                  goto err;
  1458          }
  1459          template.reg = le32_to_cpu(w->reg);
  1460          template.shift = le32_to_cpu(w->shift);
  1461          template.mask = le32_to_cpu(w->mask);
  1462          template.subseq = le32_to_cpu(w->subseq);
  1463          template.on_val = w->invert ? 0 : 1;
  1464          template.off_val = w->invert ? 1 : 0;
  1465          template.ignore_suspend = le32_to_cpu(w->ignore_suspend);
  1466          template.event_flags = le16_to_cpu(w->event_flags);
  1467          template.dobj.index = tplg->index;
  1468  
  1469          tplg->pos +=
  1470                  (sizeof(struct snd_soc_tplg_dapm_widget) +
  1471                   le32_to_cpu(w->priv.size));
  1472  
  1473          if (w->num_kcontrols == 0) {
  1474                  template.num_kcontrols = 0;
  1475                  goto widget;

This patch changed kcontrol_type to a pointer.  Originally if we hit
this goto kcontrol_type was zero but now it's uninitialized.  This will
cause a runtime error with UBSan even if it isn't a real bug.

  1476          }
  1477  
  1478          control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1479          dev_dbg(tplg->dev, "ASoC: template %s has %d controls of type %x\n",
  1480                  w->name, w->num_kcontrols, control_hdr->type);
  1481  
  1482          template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
  1483          kc = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(*kc), GFP_KERNEL);
  1484          if (!kc)
  1485                  goto err;
  1486  
  1487          kcontrol_type = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(unsigned int),
  1488                                       GFP_KERNEL);
  1489          if (!kcontrol_type)
  1490                  goto err;
  1491  
  1492          for (i = 0; i < w->num_kcontrols; i++) {
  1493                  control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
  1494                  switch (le32_to_cpu(control_hdr->ops.info)) {
  1495                  case SND_SOC_TPLG_CTL_VOLSW:
  1496                  case SND_SOC_TPLG_CTL_STROBE:
  1497                  case SND_SOC_TPLG_CTL_VOLSW_SX:
  1498                  case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
  1499                  case SND_SOC_TPLG_CTL_RANGE:
  1500                  case SND_SOC_TPLG_DAPM_CTL_VOLSW:
  1501                          /* volume mixer */
  1502                          kc[i].index = mixer_count;
  1503                          kcontrol_type[i] = SND_SOC_TPLG_TYPE_MIXER;
  1504                          mixer_count++;
  1505                          ret = soc_tplg_dapm_widget_dmixer_create(tplg, &kc[i]);
  1506                          if (ret < 0)
  1507                                  goto hdr_err;
  1508                          break;
  1509                  case SND_SOC_TPLG_CTL_ENUM:
  1510                  case SND_SOC_TPLG_CTL_ENUM_VALUE:
  1511                  case SND_SOC_TPLG_DAPM_CTL_ENUM_DOUBLE:
  1512                  case SND_SOC_TPLG_DAPM_CTL_ENUM_VIRT:
  1513                  case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
  1514                          /* enumerated mixer */
  1515                          kc[i].index = enum_count;
  1516                          kcontrol_type[i] = SND_SOC_TPLG_TYPE_ENUM;
  1517                          enum_count++;
  1518                          ret = soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
  1519                          if (ret < 0)
  1520                                  goto hdr_err;
  1521                          break;
  1522                  case SND_SOC_TPLG_CTL_BYTES:
  1523                          /* bytes control */
  1524                          kc[i].index = bytes_count;
  1525                          kcontrol_type[i] = SND_SOC_TPLG_TYPE_BYTES;
  1526                          bytes_count++;
  1527                          ret = soc_tplg_dapm_widget_dbytes_create(tplg, &kc[i]);
  1528                          if (ret < 0)
  1529                                  goto hdr_err;
  1530                          break;
  1531                  default:
  1532                          dev_err(tplg->dev, "ASoC: invalid widget control type %d:%d:%d\n",
  1533                                  control_hdr->ops.get, control_hdr->ops.put,
  1534                                  le32_to_cpu(control_hdr->ops.info));
  1535                          ret = -EINVAL;
  1536                          goto hdr_err;
  1537                  }
  1538          }
  1539  
  1540          template.kcontrol_news = kc;
  1541  
  1542  widget:
  1543          ret = soc_tplg_widget_load(tplg, &template, w);
  1544          if (ret < 0)
  1545                  goto hdr_err;
  1546  
  1547          /* card dapm mutex is held by the core if we are loading topology
  1548           * data during sound card init. */
  1549          if (card->instantiated)
  1550                  widget = snd_soc_dapm_new_control(dapm, &template);
  1551          else
  1552                  widget = snd_soc_dapm_new_control_unlocked(dapm, &template);
  1553          if (IS_ERR(widget)) {
  1554                  ret = PTR_ERR(widget);
  1555                  goto hdr_err;
  1556          }
  1557  
  1558          widget->dobj.type = SND_SOC_DOBJ_WIDGET;
  1559          widget->dobj.widget.kcontrol_type = kcontrol_type;
                                                    ^^^^^^^^^^^^^^

  1560          widget->dobj.ops = tplg->ops;
  1561          widget->dobj.index = tplg->index;
  1562          list_add(&widget->dobj.list, &tplg->comp->dobj_list);
  1563  
  1564          ret = soc_tplg_widget_ready(tplg, widget, w);
  1565          if (ret < 0)
  1566                  goto ready_err;

regards,
dan carpenter
