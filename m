Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9831030A820
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 13:57:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020D8176A;
	Mon,  1 Feb 2021 13:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020D8176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612184228;
	bh=FsPemEBDf4uSOFFOCeyyzTgk80lj6Xh3zYEXIx5SAqo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MH56dUTLOEt9byvJq2Z75O9pNlIqzQHml6sDeB3TbExw37ueDgReGvZes3toV7rqb
	 5RWxBMSzRGMlHsifCLHcqbC33galAIEIvW07p2j6AGFIvI+fsB8ExarfS2/ilBIJXY
	 wihkAlznPfXz3uVfdOB9XCgQ1b324kWdKzMACz2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F394F80154;
	Mon,  1 Feb 2021 13:55:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67DFEF80153; Mon,  1 Feb 2021 13:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5E9F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 13:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5E9F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="BziGzTOP"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CtHcs142962;
 Mon, 1 Feb 2021 12:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=2f8Ih5LzgiZbE+Q22oPEHcECsBbJuajBpZ2wCby+m/8=;
 b=BziGzTOP8U/9k9F0pKcy7z3GobhYFvA9SJGHET1nzMTuJSyNwxT5uW0HRmaD29q+mawl
 vjrWLY7QqMnh0fVedUsYEdoo7c2op4+E6uRzVqJf/QaEXr7zIGX6oj8M3PCLMfoDuKuo
 w8eM4ozGYMLUulk1qVTTUKl6vK1CsEdJyIDJDAuzCunJPZg6w8Fmz0jATHY05b5YLslG
 TUxIH0xbTHmWcmvIuAFTHciUSSrsRxXIErtJYtF2+jEo/d/wiyzN4hZc5VRUwY1QSzy1
 v1RGQcaBUIixPzh7pswiuWozqNFVP5SBPXTfAMpFOh6wleqURaYk99YgAMvJb6hBc1M9 9Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 36cydkn1sv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 12:55:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 111CUhQK083152;
 Mon, 1 Feb 2021 12:55:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 36dhcuww78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Feb 2021 12:55:23 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 111CtLOC025074;
 Mon, 1 Feb 2021 12:55:22 GMT
Received: from mwanda (/10.175.186.133)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Feb 2021 04:55:21 -0800
Date: Mon, 1 Feb 2021 15:55:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: rawmidi: Avoid racy info ioctl via ctl device
Message-ID: <YBf6NOKafgp8XfDZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=984 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102010065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9881
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=937 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010066
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

Hello Takashi Iwai,

The patch c1cfd9025cc3: "ALSA: rawmidi: Avoid racy info ioctl via ctl
device" from Dec 14, 2017, leads to the following static checker
warning:

	sound/core/rawmidi.c:651 snd_rawmidi_info_select()
	warn: called with lock held.  '&register_mutex'

sound/core/seq/seq_midi.c
   297          mutex_lock(&register_mutex);
                           ^^^^^^^^^^^^^^^
Holding this lock.

   298          client = synths[card->number];
   299          if (client == NULL) {
   300                  newclient = 1;
   301                  client = kzalloc(sizeof(*client), GFP_KERNEL);
   302                  if (client == NULL) {
   303                          mutex_unlock(&register_mutex);
   304                          kfree(info);
   305                          return -ENOMEM;
   306                  }
   307                  client->seq_client =
   308                          snd_seq_create_kernel_client(
   309                                  card, 0, "%s", card->shortname[0] ?
   310                                  (const char *)card->shortname : "External MIDI");
   311                  if (client->seq_client < 0) {
   312                          kfree(client);
   313                          mutex_unlock(&register_mutex);
   314                          kfree(info);
   315                          return -ENOMEM;
   316                  }
   317          }
   318  
   319          msynth = kcalloc(ports, sizeof(struct seq_midisynth), GFP_KERNEL);
   320          port = kmalloc(sizeof(*port), GFP_KERNEL);
   321          if (msynth == NULL || port == NULL)
   322                  goto __nomem;
   323  
   324          for (p = 0; p < ports; p++) {
   325                  ms = &msynth[p];
   326  
   327                  if (snd_seq_midisynth_new(ms, card, device, p) < 0)
   328                          goto __nomem;
   329  
   330                  /* declare port */
   331                  memset(port, 0, sizeof(*port));
   332                  port->addr.client = client->seq_client;
   333                  port->addr.port = device * (256 / SNDRV_RAWMIDI_DEVICES) + p;
   334                  port->flags = SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
   335                  memset(info, 0, sizeof(*info));
   336                  info->device = device;
   337                  if (p < output_count)
   338                          info->stream = SNDRV_RAWMIDI_STREAM_OUTPUT;
   339                  else
   340                          info->stream = SNDRV_RAWMIDI_STREAM_INPUT;
   341                  info->subdevice = p;
   342                  if (snd_rawmidi_info_select(card, info) >= 0)
                            ^^^^^^^^^^^^^^^^^^^^^^^
We can't call this function when we're holding the lock or it leads to
a deadlock.  Before the patch, we used to rely on the callers to take
the lock before calling snd_rawmidi_info_select() but the patch moved
the lock inside the function.

   343                          strcpy(port->name, info->subname);
   344                  if (! port->name[0]) {
   345                          if (info->name[0]) {
   346                                  if (ports > 1)
   347                                          snprintf(port->name, sizeof(port->name), "%s-%u", info->name, p);
   348                                  else
   349                                          snprintf(port->name, sizeof(port->name), "%s", info->name);

regards,
dan carpenter
