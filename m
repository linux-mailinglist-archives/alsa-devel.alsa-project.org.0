Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7E30B78B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 07:00:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5A73176F;
	Tue,  2 Feb 2021 06:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5A73176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612245604;
	bh=PsJlHrIjmIlt9vcp5ahJk8Tn5q52/7kCiDH/EA35pfI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fJk2R66vPl/5KkXLaELYaAST53YQKzvwZ2v2UHoFMEfxuDKoopRGl/P4mtlr2Qoph
	 I6IHPbYdTUma9KZgDHh2GoXnP5ZgZlv7HiI+i5aIojXnlGUUMn4PL6RfiKPZXZcZCU
	 Se0PvKbueVlq5fijmQNefE04FgJW9GCIBDL9De68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F3DAF80152;
	Tue,  2 Feb 2021 06:58:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F398EF80171; Tue,  2 Feb 2021 06:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=BIGNUM_EMAILS,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D10FCF8013C
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 06:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D10FCF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="gmpWp+Wh"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1125nZ8J119963
 for <alsa-devel@alsa-project.org>; Tue, 2 Feb 2021 05:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=l25mad4LZvhadWPL/N4Swfai5rLZNvgHdWYnRSbapi4=;
 b=gmpWp+Whyi/ldCoOkZ4tpxS97ug/wo3meZfKxKKXZPUW5NhSsXXs3ANFGNH+KKeZayt3
 u+bxsq79FQvN1Xv89gJyKRiAnZEeaKCdPmMrdClF1xMv9I8FlzHZ2N5aNMd9EHMrqsQh
 /KhIY8XlMN7vrbnmVmR9VZu1VodbEAdDutQJdJKfAbOORL+pX1JRi09BifQH5aoVZMn4
 THuCx5JyGUS3T6B4gRJtgb1Yl9YrFQKoGFEb1YaFQe5/cqCAlb4lfvDTu3f7SLwADmfW
 yMONMawzSn01EU1ppio+c3T5cRr0fujiX3N4+WYRn5huvxfmgX2uuJ5jw9z+oM051HOp CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36cvyas4fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 05:58:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1125tR8p140218;
 Tue, 2 Feb 2021 05:56:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 36dh1ng55q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 05:56:18 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1125uF8S023159;
 Tue, 2 Feb 2021 05:56:17 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Feb 2021 21:56:15 -0800
Date: Tue, 2 Feb 2021 08:56:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: alsa-devel@alsa-project.org
Subject: [bug report] potential deadlock in snd_emu10k1_voice_alloc()
Message-ID: <YBjpeGqqiEYLaNyx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=837 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020041
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=683
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020040
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

Hello ALSA devs,

The patch 1da177e4c3f4: "Linux-2.6.12-rc2" from Apr 16, 2005, leads
to the following static checker warning:

	sound/pci/emu10k1/voice.c:112 snd_emu10k1_voice_alloc()
	warn: called with lock held.  '&emu->voice_lock'

sound/pci/emu10k1/voice.c
   101  int snd_emu10k1_voice_alloc(struct snd_emu10k1 *emu, int type, int number,
   102                              struct snd_emu10k1_voice **rvoice)
   103  {
   104          unsigned long flags;
   105          int result;
   106  
   107          if (snd_BUG_ON(!rvoice))
   108                  return -EINVAL;
   109          if (snd_BUG_ON(!number))
   110                  return -EINVAL;
   111  
   112          spin_lock_irqsave(&emu->voice_lock, flags);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This lock is already held in the caller.

   113          for (;;) {
   114                  result = voice_alloc(emu, type, number, rvoice);
   115                  if (result == 0 || type == EMU10K1_SYNTH || type == EMU10K1_MIDI)
   116                          break;
   117  
   118                  /* free a voice from synth */
   119                  if (emu->get_synth_voice) {

The call tree is:

	 snd_emux_note_on()
		takes the lock: spin_lock_irqsave(&emu->voice_lock, flags);
		calls vp = emu->ops.get_voice(emu, port);
	   --> get_voice()
		--> snd_emu10k1_voice_alloc()

regards,
dan carpenter
