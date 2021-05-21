Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBC38C66D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 14:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6C416A4;
	Fri, 21 May 2021 14:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6C416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621599788;
	bh=t6T4tINt2eUlgoGoQbVyrv/GWwyKX2KIjM2MzkTppi0=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cDmEUa5/waIUTH9+M+HZ4rWAAiMB2TU/5q0JGACzLIvbrCg1HMgDKKdcI7/kg8HFh
	 CUrhJzgOdPFlb0ao7uoeY49GZsq+pk7RaB/DQBjae7XFFjukSz1ETW+g9q3BuYMnqu
	 TjUBwmUMJnyMB5q1lSNzS7f84lsru03GHHdEMoE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 905C0F80246;
	Fri, 21 May 2021 14:21:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ECA2F801DB; Fri, 21 May 2021 14:21:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA66F800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 14:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA66F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ovPvmuyv"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LC9mik191435;
 Fri, 21 May 2021 12:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=J6Z7C57gx3aY9ETcNeaXejiQ/8jacXIO7vDiLhEG72o=;
 b=ovPvmuyvam/G6Ts2UdZ6jg4pcYNVQnEuNTWAsZQLLGBLIfkyZumosPs5S/xQBwkqIyb1
 OBWTfhpdXANEv0BdgUYiphOO2mOrxWWZFsUauwRPNZ7F1xyu/AeiHxuqM8zvPw34de8S
 XPSH89slQfucOUcnLu7flB3XxVWAsvaT+F+kd3a0VQuUWMC2iYUjmGMJ7+qV8r0KEAer
 hXYNCtuFzBiVfw3zswpwSQvzj4+EKRJWSxdJP/i4wQG1PgopuRcudPCo+RK/BiyHBLBl
 eBEwa2geD27L4+oo2mgh2k8Mj4v3hV+thllltQ6YbqPfmiYumjvQTctcI7+sCG9wD88w DA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 38j6xnqf27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 12:21:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14LCBcbN177464;
 Fri, 21 May 2021 12:21:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38meehr1wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 12:21:20 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14LCLKK6001973;
 Fri, 21 May 2021 12:21:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 38meehr1w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 12:21:20 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14LCLG19013757;
 Fri, 21 May 2021 12:21:19 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 May 2021 05:21:16 -0700
Date: Fri, 21 May 2021 15:21:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tiwai@suse.de
Subject: [bug report] ALSA: usb-audio: Handle error for the current selector
 gracefully
Message-ID: <YKeltyIlWG//CfYi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: WgKLYeQe8TcXUj_REdRxryN6ljzokHF1
X-Proofpoint-ORIG-GUID: WgKLYeQe8TcXUj_REdRxryN6ljzokHF1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210074
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

The patch 481f17c41803: "ALSA: usb-audio: Handle error for the
current selector gracefully" from May 18, 2021, leads to the
following static checker warning:

	sound/usb/clock.c:338 __uac_clock_find_source()
	error: uninitialized symbol 'cur'.

sound/usb/clock.c
   254  static int __uac_clock_find_source(struct snd_usb_audio *chip,
   255                                     const struct audioformat *fmt, int entity_id,
   256                                     unsigned long *visited, bool validate)
   257  {
   258          union uac23_clock_source_desc *source;
   259          union uac23_clock_selector_desc *selector;
   260          union uac23_clock_multiplier_desc *multiplier;
   261          int ret, i, cur, err, pins, clock_id;
                            ^^^

   262          const u8 *sources;
   263          int proto = fmt->protocol;
   264  
   265          entity_id &= 0xff;
   266  
   267          if (test_and_set_bit(entity_id, visited)) {
   268                  usb_audio_warn(chip,
   269                           "%s(): recursive clock topology detected, id %d.\n",
   270                           __func__, entity_id);
   271                  return -EINVAL;
   272          }
   273  
   274          /* first, see if the ID we're looking for is a clock source already */
   275          source = snd_usb_find_clock_source(chip, entity_id, proto);
   276          if (source) {
   277                  entity_id = GET_VAL(source, proto, bClockID);
   278                  if (validate && !uac_clock_source_is_valid(chip, fmt,
   279                                                                  entity_id)) {
   280                          usb_audio_err(chip,
   281                                  "clock source %d is not valid, cannot use\n",
   282                                  entity_id);
   283                          return -ENXIO;
   284                  }
   285                  return entity_id;
   286          }
   287  
   288          selector = snd_usb_find_clock_selector(chip, entity_id, proto);
   289          if (selector) {
   290                  pins = GET_VAL(selector, proto, bNrInPins);
   291                  clock_id = GET_VAL(selector, proto, bClockID);
   292                  sources = GET_VAL(selector, proto, baCSourceID);
   293  
   294                  if (pins == 1) {
   295                          ret = 1;
   296                          goto find_source;
   297                  }
   298  
   299                  /* the entity ID we are looking for is a selector.
   300                   * find out what it currently selects */
   301                  ret = uac_clock_selector_get_val(chip, clock_id);
   302                  if (ret < 0) {
   303                          if (!chip->autoclock)
   304                                  return ret;
   305                          goto find_others;
                                ^^^^^^^^^^^^^^^^^
Assume we hit one of these gotos

   306                  }
   307  
   308                  /* Selector values are one-based */
   309  
   310                  if (ret > pins || ret < 1) {
   311                          usb_audio_err(chip,
   312                                  "%s(): selector reported illegal value, id %d, ret %d\n",
   313                                  __func__, clock_id, ret);
   314  
   315                          if (!chip->autoclock)
   316                                  return -EINVAL;
   317                          ret = 0;
   318                          goto find_others;
                                ^^^^^^^^^^^^^^^^^

   319                  }
   320  
   321          find_source:
   322                  cur = ret;
   323                  ret = __uac_clock_find_source(chip, fmt,
   324                                                sources[ret - 1],
   325                                                visited, validate);
   326                  if (ret > 0) {
   327                          err = uac_clock_selector_set_val(chip, entity_id, cur);
   328                          if (err < 0)
   329                                  return err;
   330                  }
   331  
   332                  if (!validate || ret > 0 || !chip->autoclock)
   333                          return ret;
   334  
   335          find_others:
   336                  /* The current clock source is invalid, try others. */
   337                  for (i = 1; i <= pins; i++) {
   338                          if (i == cur)
                                    ^^^^^^^^

   339                                  continue;
   340  
   341                          ret = __uac_clock_find_source(chip, fmt,
   342                                                        sources[i - 1],
   343 

regards,
dan carpenter
