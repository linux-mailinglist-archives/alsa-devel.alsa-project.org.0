Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F325696E3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 02:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B127B164D;
	Thu,  7 Jul 2022 02:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B127B164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657153683;
	bh=lhBfukVW7neZC+ZVpELutBN2eIBL6QIMMWaFcuVgtsY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uKXGJSW8gQDVSUu4P0GZRfBSaSSHKLT9UBooKYimzWmbBSvigsw48ghlVVG2mQ9Jk
	 5CEKtHDA/FtbG5yq0OsJMboNnIQSq/Wje30T/P01txRNG1Vv6eTxFMSp3d78W6yEe+
	 W/njd0UsCJm7pFUoHatGOT+ZrcauWYzvvT9QlMSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A3EEF8032B;
	Thu,  7 Jul 2022 02:27:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4288FF8023A; Thu,  7 Jul 2022 02:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3769DF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 02:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3769DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com
 header.b="bAPBUAc0"; 
 dkim=pass (1024-bit key) header.d=fluxnic.net header.i=@fluxnic.net
 header.b="i4VY5+IV"
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id B030D13FF74
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 20:26:53 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
 :to:subject:message-id:mime-version:content-type; s=sasl; bh=lhB
 fukVW7neZC+ZVpELutBN2eIBL6QIMMWaFcuVgtsY=; b=bAPBUAc06c6//U0kve6
 ZVzjriuJegFDDKAgwI/hfIePOmgR+Jl1Eai5CiOmYLv5oFPr3wtBcFuNrncIPcMx
 NeapPDBHJFoqhtB2NcrQw0NmMMNSi9sFDt1CZOE5RVq2IE8BWscHup7U3QEN+w02
 mmKP64lKRb3EyYNpdotL2ZWI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 93B7A13FF73
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 20:26:53 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:subject:message-id:mime-version:content-type;
 s=2016-12.pbsmtp; bh=lhBfukVW7neZC+ZVpELutBN2eIBL6QIMMWaFcuVgtsY=;
 b=i4VY5+IV66gpP4f8emK8ZxM7icD57knvcEjTFLTJvYQBkbQO1QtVX6zkTiRKrnu3Y9YNBJ1XmXBeoNLFOkqmoVXNMhzELqTYf07FLPWAoH/bEeNO+HR+YUEwjiu0HuY3RK/+is1dwNvBPxht3+GR98axbaFeKOxD5wDlr1XGZ58=
Received: from yoda.home (unknown [96.21.170.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id E2C7213FF72
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 20:26:52 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id C1E76321EA5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 20:26:51 -0400 (EDT)
Date: Wed, 6 Jul 2022 20:26:51 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: alsa-devel@alsa-project.org
Subject: pcm.c:3236: snd_pcm_area_copy: Assertion `src < dst || src >= dst
 + bytes' failed.
Message-ID: <8q4852-o070-q566-q98-1nr43s18q0@syhkavp.arg>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1580294549-1657153611=:26437"
X-Pobox-Relay-ID: 7FE20B0C-FD8B-11EC-947C-CB998F0A682E-78420484!pb-smtp2.pobox.com
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1580294549-1657153611=:26437
Content-Type: text/plain; charset=US-ASCII

Anyone could tell me what's wrong with the attached code? I get a 100% 
reproducible crash that ends in $subject and a core dump as soon as 
snd_pcm_drain() is called.

This is a test case to reliably demonstrate the same issue I get when 
using espeak-ng. It is somewhat harder to reproduce with espeak as it 
happens more randomly, but still highly irritating.

Here's the output from the attached test case on my system using
alsalib v1.2.7.1:

PCM config dump:
Plug PCM: Rate conversion PCM (48000, sformat=S16_LE)
Converter: linear-interpolation
Protocol version: 10003
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 22050
  exact rate   : 22050 (22050/1)
  msbits       : 16
  buffer_size  : 1411
  period_size  : 470
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 470
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 1411
  silence_threshold: 0
  silence_size : 0
  boundary     : 3177289537109884928
Slave: Route conversion PCM (sformat=S16_LE)
  Transformation table:
    0 <- 0
    1 <- 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 3072
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 2
  stop_threshold   : 3072
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
Slave: Direct Stream Mixing PCM
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 3072
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 2
  stop_threshold   : 3072
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
Hardware PCM card 1 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 4096
  period_size  : 1024
  period_time  : 21333
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1024
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 0
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 5121

frames = 1411
writing whole buffer
writing whole buffer
writing whole buffer minus 1 frame
draining audio
alsa_quickcrash: pcm.c:3236: snd_pcm_area_copy: Assertion `src < dst || src >= dst + bytes' failed.
Aborted (core dumped)
--8323328-1580294549-1657153611=:26437
Content-Type: text/plain; name=alsa_quickcrash.c
Content-Transfer-Encoding: BASE64
Content-ID: <36n527rp-p5n7-qo8o-p094-923nn09nr25@syhkavp.arg>
Content-Description: 
Content-Disposition: attachment; filename=alsa_quickcrash.c

LyogdG8gY29tcGlsZTogZ2NjIC1PMiAtV2FsbCAtbyBhbHNhX3F1aWNrY3Jh
c2ggYWxzYV9xdWlja2NyYXNoLmMgLWxhc291bmQgKi8NCg0KI2luY2x1ZGUg
PGFsc2EvYXNvdW5kbGliLmg+DQojaW5jbHVkZSA8c3RkaW8uaD4NCiNpbmNs
dWRlIDxzdHJpbmcuaD4NCg0KI2RlZmluZSBSQVRFIDIyMDUwDQojZGVmaW5l
IENIQU5ORUxTIDENCiNkZWZpbmUgRk9STUFUIFNORF9QQ01fRk9STUFUX1Mx
Nl9MRQ0KI2RlZmluZSBCVUZfTVMgNjANCg0KI2RlZmluZSBETyh4KSBpZiAo
eCA8IDApIHsgZnByaW50ZihzdGRlcnIsICIlcyBmYWlsZWRcbiIsICN4KTsg
ZXhpdCgxKTsgfQ0KDQppbnQgbWFpbigpDQp7DQoJdW5zaWduZWQgaW50IHJh
dGUgPSBSQVRFOw0KCXNuZF9wY21fdWZyYW1lc190IGZyYW1lcyA9IFJBVEUg
KiBCVUZfTVMgLyAxMDAwOw0KCXNuZF9wY21fdCAqaGFuZGxlOw0KCXNuZF9w
Y21faHdfcGFyYW1zX3QgKnBhcmFtczsNCg0KCURPKHNuZF9wY21faHdfcGFy
YW1zX21hbGxvYygmcGFyYW1zKSk7DQoJRE8oc25kX3BjbV9vcGVuKCZoYW5k
bGUsICJkZWZhdWx0IiwgU05EX1BDTV9TVFJFQU1fUExBWUJBQ0ssIDApKTsN
CglETyhzbmRfcGNtX2h3X3BhcmFtc19hbnkoaGFuZGxlLCBwYXJhbXMpKTsN
CglETyhzbmRfcGNtX2h3X3BhcmFtc19zZXRfYWNjZXNzKGhhbmRsZSwgcGFy
YW1zLCBTTkRfUENNX0FDQ0VTU19SV19JTlRFUkxFQVZFRCkpOw0KCURPKHNu
ZF9wY21faHdfcGFyYW1zX3NldF9mb3JtYXQoaGFuZGxlLCBwYXJhbXMsIEZP
Uk1BVCkpOw0KCURPKHNuZF9wY21faHdfcGFyYW1zX3NldF9yYXRlX25lYXIo
aGFuZGxlLCBwYXJhbXMsICZyYXRlLCAwKSk7DQoJRE8oc25kX3BjbV9od19w
YXJhbXNfc2V0X2NoYW5uZWxzKGhhbmRsZSwgcGFyYW1zLCBDSEFOTkVMUykp
Ow0KCURPKHNuZF9wY21faHdfcGFyYW1zX3NldF9idWZmZXJfc2l6ZV9uZWFy
KGhhbmRsZSwgcGFyYW1zLCAmZnJhbWVzKSk7DQoJRE8oc25kX3BjbV9od19w
YXJhbXMoaGFuZGxlLCBwYXJhbXMpKTsNCglETyhzbmRfcGNtX3ByZXBhcmUo
aGFuZGxlKSk7DQoNCglwcmludGYoIlBDTSBjb25maWcgZHVtcDpcbiIpOw0K
CXNuZF9vdXRwdXRfdCAqb3V0cHV0ID0gTlVMTDsNCglETyhzbmRfb3V0cHV0
X3N0ZGlvX2F0dGFjaCgmb3V0cHV0LCBzdGRvdXQsIDApKTsNCglETyhzbmRf
cGNtX2R1bXAoaGFuZGxlLCBvdXRwdXQpKTsNCglwcmludGYoIlxuIik7DQoN
CglwcmludGYoImZyYW1lcyA9ICVsZFxuIiwgKGxvbmcpZnJhbWVzKTsNCglz
aG9ydCBkYXRhW2ZyYW1lcyAqIENIQU5ORUxTXTsNCgltZW1zZXQoZGF0YSwg
MCwgc2l6ZW9mKGRhdGEpKTsNCg0KCXByaW50Zigid3JpdGluZyB3aG9sZSBi
dWZmZXJcbiIpOw0KCURPKHNuZF9wY21fd3JpdGVpKGhhbmRsZSwgZGF0YSwg
ZnJhbWVzKSk7DQoJcHJpbnRmKCJ3cml0aW5nIHdob2xlIGJ1ZmZlclxuIik7
DQoJRE8oc25kX3BjbV93cml0ZWkoaGFuZGxlLCBkYXRhLCBmcmFtZXMpKTsN
CglwcmludGYoIndyaXRpbmcgd2hvbGUgYnVmZmVyIG1pbnVzIDEgZnJhbWVc
biIpOw0KCURPKHNuZF9wY21fd3JpdGVpKGhhbmRsZSwgZGF0YSwgZnJhbWVz
IC0gMSkpOw0KDQoJcHJpbnRmKCJkcmFpbmluZyBhdWRpb1xuIik7DQoJRE8o
c25kX3BjbV9kcmFpbihoYW5kbGUpKTsNCgkNCglwcmludGYoImRvbmVcbiIp
Ow0KCURPKHNuZF9wY21fY2xvc2UoaGFuZGxlKSk7DQoJcmV0dXJuIDA7DQp9
DQo=

--8323328-1580294549-1657153611=:26437--
