Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C87DB294C7A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 14:23:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3112016F0;
	Wed, 21 Oct 2020 14:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3112016F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603282986;
	bh=QRRLJJCgCchGgkmSwZ7wzeY02FxQfCvuAPy1mKjRubQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FT8pEpgFBEm7jMgZhC2oLpZfbxci5tImmy2X19bRdqpB7HCJYNdGFkqZSlajAIReo
	 DuxCuNcQhzLXiIjhuOTl4Cc2M/9GIEeJr+XrzLJfors4LXLsBO6NWjhCHfv0JkR8pT
	 6vylhPz6D90e3siGAcRav+HR1ZstzIbTTqVZ/iXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CBF6F8011C;
	Wed, 21 Oct 2020 14:21:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2C1AF80264; Wed, 21 Oct 2020 14:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1FD1F80247
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 14:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FD1F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="w5fJdtVV"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LCAR9g015894;
 Wed, 21 Oct 2020 12:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=RXNlos6BSKLoTFr62EZqJgCL0PC7K8R3TCn9URGepiw=;
 b=w5fJdtVV2YByGmWdM9tIPiYCC7UWgK4YOi4LLGOVcWQL0esRi9p6GKMGTZFcanwuRW3l
 F99zcAwMiBWqWzQS0g2PBcGwSnD5QXI95PJ70BHxXpoMPW+HhXhxgVfSh0YoZvTrQqnh
 1WblgL/zpWuycgh/ZTRW8pQlt6dlilhElKFo/HpGHRD6GffWlf4qhtFn/n8Ai8zBBHde
 41GlwiMKnJ02DmlHoewZSM0q03MyoeH4ZhSX3xcI3XRV6iJJTF5a1NsqCbqiv0dEhB+5
 pqlVvIiC5RewwhYfi1GqXGT1CSOtsMT3nwCgyyiiRjUdxIx8OootJklGTDBgkZ7ppZ10 3w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 34ak16gfne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 12:21:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LC9uYU029247;
 Wed, 21 Oct 2020 12:19:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34ak18kqyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 12:19:15 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09LCJB1m005907;
 Wed, 21 Oct 2020 12:19:14 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Oct 2020 05:19:09 -0700
Date: Wed, 21 Oct 2020 15:19:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hui.wang@canonical.com
Subject: [bug report] ALSA: hda - Don't register a cb func if it is
 registered already
Message-ID: <20201021121904.GA1126544@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=979 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010210097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9780
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=986
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210097
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

Hello Hui Wang,

The patch f4794c6064a8: "ALSA: hda - Don't register a cb func if it
is registered already" from Sep 30, 2020, leads to the following
static checker warning:

	sound/pci/hda/patch_sigmatel.c:3075 stac92hd71bxx_fixup_hp_m4()
	warn: 'jack' can also be NULL

sound/pci/hda/patch_sigmatel.c
  3069          /* Enable VREF power saving on GPIO1 detect */
  3070          snd_hda_codec_write_cache(codec, codec->core.afg, 0,
  3071                                    AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x02);
  3072          jack = snd_hda_jack_detect_enable_callback(codec, codec->core.afg,
  3073                                                     stac_vref_event);

Originally snd_hda_jack_detect_enable_callback() would not return NULL
here.

  3074          if (!IS_ERR(jack))
  3075                  jack->private_data = 0x02;
  3076  
  3077          spec->gpio_mask |= 0x02;

But now we have this:

sound/pci/hda/hda_jack.c
   301  struct hda_jack_callback *
   302  snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
   303                                          int dev_id, hda_jack_callback_fn func)
   304  {
   305          struct hda_jack_tbl *jack;
   306          struct hda_jack_callback *callback = NULL;
   307          int err;
   308  
   309          jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
   310          if (!jack)
   311                  return ERR_PTR(-ENOMEM);
   312          if (func && !func_is_already_in_callback_list(jack, func)) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We only allocate callback if there isn't one already.

   313                  callback = kzalloc(sizeof(*callback), GFP_KERNEL);
   314                  if (!callback)
   315                          return ERR_PTR(-ENOMEM);
   316                  callback->func = func;
   317                  callback->nid = jack->nid;
   318                  callback->dev_id = jack->dev_id;
   319                  callback->next = jack->callback;
   320                  jack->callback = callback;
   321          }
   322  
   323          if (jack->jack_detect)
   324                  return callback; /* already registered */
                        ^^^^^^^^^^^^^^^
So presumably this should be jack->callback


   325          jack->jack_detect = 1;
   326          if (codec->jackpoll_interval > 0)
   327                  return callback; /* No unsol if we're polling instead */
                        ^^^^^^^^^^^^^^^^

   328          err = snd_hda_codec_write_cache(codec, nid, 0,
   329                                           AC_VERB_SET_UNSOLICITED_ENABLE,
   330                                           AC_USRSP_EN | jack->tag);
   331          if (err < 0)
   332                  return ERR_PTR(err);
   333          return callback;
                ^^^^^^^^^^^^^^^^
And these as well.

   334  }

regards,
dan carpenter
