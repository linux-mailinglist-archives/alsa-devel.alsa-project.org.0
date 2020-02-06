Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B7153FCD
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 09:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6423F1689;
	Thu,  6 Feb 2020 09:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6423F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580976953;
	bh=EfYahE2RCKA5uLgeYpexKlu/ue7DeX5ev+6Zd+6Bgbk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJGZLpfen1cAz/iOz9unq46odOzsjuKN+d5gNbAsKPIEELoTTzQulpMC50vVfG42l
	 ilsiGG632LRzMidxSji6+ENYzlzJrrT0GZO95X3K1ToVPMt5yTqObpF1OgTab0wemy
	 bnpmzUzt+n+msNndUHvlguv/repxnySRIWd6AxlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA597F801DB;
	Thu,  6 Feb 2020 09:14:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148A9F80212; Thu,  6 Feb 2020 09:14:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A52E8F800AB;
 Thu,  6 Feb 2020 09:14:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A52E8F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="ejJKFyVY"
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 48Crnf1yWpz1XLFjd;
 Thu,  6 Feb 2020 09:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key3-intmail; t=1580976886;
 bh=1yDiA/cwYgFH9o2PUR4pXrQTa+EzRle8VLpopTF4DoM=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=ejJKFyVYMTbwfi4VuzM0X4/Oz/JfdGGiEgSrjlDbN+5hUazNETnyJRgkhWRci+jIU
 IZqSCMNkEEee++M3pefWbFu9yTWzTHltgDpZE5piLZgCdflZETbfPWwO0iPMd/kE/s
 NvavanLbVHMyTeAOebZyRbe8vkpfaB1So3AO+sJg=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 48Crnf1L7zz1ws;
 Thu,  6 Feb 2020 09:14:46 +0100 (CET)
X-AuditID: 0a3aad12-e6bff700000045d7-04-5e3bcaf5e488
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id 89.06.17879.5FACB3E5;
 Thu,  6 Feb 2020 09:14:45 +0100 (CET)
Received: from FE-MBX2032.de.bosch.com (fe-mbx2032.de.bosch.com [10.3.231.42])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 48Crnd6XvFzB0w;
 Thu,  6 Feb 2020 09:14:45 +0100 (CET)
Received: from SGPMBX2001.APAC.bosch.com (10.187.56.75) by
 FE-MBX2032.de.bosch.com (10.3.231.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Thu, 6 Feb 2020 09:14:45 +0100
Received: from SGPMBX2003.APAC.bosch.com (10.187.56.76) by
 SGPMBX2001.APAC.bosch.com (10.187.56.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Thu, 6 Feb 2020 16:14:42 +0800
Received: from SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836]) by
 SGPMBX2003.APAC.bosch.com ([fe80::d4a:a83a:3749:3836%3]) with mapi id
 15.01.1847.005; Thu, 6 Feb 2020 16:14:42 +0800
From: "Channaiah Vanitha (RBEI/ECF3)" <Vanitha.Channaiah@in.bosch.com>
To: "patch@alsa-project.org" <patch@alsa-project.org>
Thread-Topic: [PATCH - 1/1] pcm: direct: Round down of slave_hw_ptr when
 buffer size is two period size
Thread-Index: AQHV3MVKy90mxXyeWUCn8A/zmbhqMagN0SFA
Date: Thu, 6 Feb 2020 08:14:42 +0000
Message-ID: <40c16023f7af40bba1ee87876a740253@in.bosch.com>
References: <1580976781-6642-1-git-send-email-vanitha.channaiah@in.bosch.com>
In-Reply-To: <1580976781-6642-1-git-send-email-vanitha.channaiah@in.bosch.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.204]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22Tf0wbZRjHee+O20vHkeuVwrNCE3dhiZmTAYLBdZmaGHVbtrlF/WNRtiIH
 rYO26RX2w5gxE5UVguDATrBIS5lWYUxGLCjEUbcsbMOujE3AxTglKowFBnRqZtRrr6z9w38u
 3/d5ns/zfN/n7jDJncIabDTZBKtJX87TCkqxqVv7aOiSriin9ZvNheNBP1HY/Ul14lPE82eW
 3qJfQHsVm0uEcmOVYN24Zb/C4K53E5YBzaHLrrrEanRfbUcYA5sPI8c4O1JgjnUQsHTXs0o+
 fIXAe81Hyod5BAvOGsqOkqTDIgJXXZWcGEYw0dhKhxM0+yzM28ciOpUtgIXAnYgm2YMwdPtE
 BFaxBrhyIRCtMYKj5jQh6zxw1nsjcYrNgkDfAgprhtXBta7ORHnwDuia/ZMM6yR2JwyeqY3U
 I1YL7sn3KXlWOkxNfxzpCSwLnsEAKWs1zPzyT6Ks18Lccu8quX4DtH+9GPX5CJxy3SbluUoY
 +XCaakDQEte2JQ5piUNa4pB2RH2G1KIxp6oi//H8vGxrsSAeycnNfs1c0Yvkl8b1oy9ulPoR
 gZEfFWCCVzP4TV0Rl1JsLjls0IuGfdbKckHkNczRueOvcqoHYbGyuMIoikazyY8Ak3wqE9j4
 RBHHlOgPHxGsZhnzowxM8elMGd71CseW6W3CAUGwCNaV7HMYs+PD51uRhjKZTQIPjP+iNFxp
 FcqEQ6XGcttKKa9lUEJCApcWn4m3QOAkP3oMJ0s+to1ILRjRoq8QjWVRfI2McyvRGHoJbcUN
 M043iYcvtLlJLmJEk84I4S5suN5QaXrgQ5PJ9OzeVMSp4xKxXrNoEmHEq5jXw3Cy9H/EHABT
 HV6gMhqMQXmdEsOGGPh2QfrO25auI2gO/iA9/rpKQVOPi4Yat5+GnnuXaWi62oyhbfqkAk7c
 mVbAwI1fFfD5XNtq+PTuzGrouOlMhv7lnhQYqz+rhKmgg4OBkTEOrnReVMHJ691qaOg6lgbe
 vsY0WG4NpkPfrAeg97hjDYw3uzKg69Z3GfCjfTkTmk6HMuF849BDEBh+by14Q53rZqX1EtJ6
 M7YXhtdr09v+Z73RaOx2mmqU9eL9pJ0Jpjre8VKpkk59d//fv9PnfOu99/7Y9szoELvXt2vL
 w0S/JfDBG3sKFj/qeNm3LtXj6dAFJ0fPUk9/73rHV2Oc2XBusGMfXatrbwwlZ9cfraq0fKlO
 mcq/+eTPtVk7Joozt+usfN6/v436Jt7+qd+LnCqtVnVQW3vg1tb5XJ4SDfrc9aRV1P8HjPTL
 trkEAAA=
Cc: "Wischer Timo \(ADITG/ESS\)" <twischer@de.adit-jv.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH - 1/1] pcm: direct: Round down of
 slave_hw_ptr when buffer size is two period size
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

Hello Takashi-san,

This patch is regarding the fix for rounding down/up of slave pointers.
For buffer_size >= 2*period_size, round down of slave pointers and
for buffer_size < 2*period_size, round up of slave pointers will avoid xruns.
which otherwise causes snd_pcm_wait() to block for more than expected snd_pcm_period_elapsed() which leads to xruns.

We had similar discussion for same issue in below link:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/151169.html

Regards,
Vanitha


-----Original Message-----
From: Channaiah Vanitha (RBEI/ECF3) <Vanitha.Channaiah@in.bosch.com> 
Sent: Thursday, February 6, 2020 1:43 PM
To: Channaiah Vanitha (RBEI/ECF3) <Vanitha.Channaiah@in.bosch.com>; patch@alsa-project.org
Cc: alsa-devel@alsa-project.org; Wischer Timo (ADITG/ESS) <twischer@de.adit-jv.com>
Subject: [PATCH - 1/1] pcm: direct: Round down of slave_hw_ptr when buffer size is two period size

From: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

For buffer size equal to two period size, the start position of slave_hw_ptr is rounded down in order to avoid xruns

For e.g.:
Considering below parameters and its values:
Period size = 96 (0x60)
Buffer size = 192 (0xC0)
Timer ticks = 1
avail_min = 0x60
slave_hw_ptr = unaligned value during dmix_start()

Issue:
- Initial, app_ptr = hw_ptr = 0
- Application fills buffer size of data. so app_ptr = 0xC0, hw_ptr = 0
- During dmix_start(), current slave_hw_ptr is not rounded down. current slave_hw_ptr would be 0x66
- slave_hw_ptr is keep on updating at the hardware 0x67, 0x68, 0x69
- The diff calculation between old_slave_hw_ptr(0x66) and new_slave_hw_ptr(0x69)
  results in avail = 0x6
- After 1 snd_pcm_period_elapsed(), slave_hw_ptr = 0xC0
- The result of avail = 0x5A which is less than avail_min(0x60)
- Here, xruns will be observed

Fix:
- Initial, app_ptr = hw_ptr = 0
- Application fills buffer size of data. so app_ptr = 0xC0, hw_ptr = 0
- Round down of slave_hw_ptr during dmix_start() leads to below calculation:
- During dmix_start(), slave_hw_ptr rounded to 0x60 (old slave_hw_ptr)
- The diff calculation between old_slave_hw_ptr(0x60) and new_slave_hw_ptr(0x69)
  results in avail = 0x9
- After 1 snd_pcm_period_elapsed(), slave_hw_ptr = 0xC0
- The result of avail = 0x60 which is avail_min(0x60)
- Here, xruns can be avoided

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c index 54d9900..a201fa3 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2043,10 +2043,14 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)  {
+    /*
+     * For buffer size equal to two period size, slave_hw_ptr is rounded down
+     * to avoid xruns
+     */
 
 	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
 		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
-		pcm->buffer_size <= pcm->period_size * 2))
+		pcm->buffer_size < pcm->period_size * 2))
 		dmix->slave_appl_ptr =
 			((dmix->slave_appl_ptr + dmix->slave_period_size - 1) /
 			dmix->slave_period_size) * dmix->slave_period_size;
--
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
