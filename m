Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 200025A0F1F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 13:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B648E84A;
	Thu, 25 Aug 2022 13:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B648E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661427175;
	bh=s8WwXm1MfWZxpBec+DjaYjnP9QFdF2PfTJyxYi67GUI=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=CZeYrAIguyoOg/r7aZC3OTr5HxtppnGO9hyqHyincyNl5tLdfccyELgQOu9ktDzPm
	 Wa2lFLbNwmvYpP6Ay3GQFsstrQgHHJGhpfrE4YV8oXNHUoAM64FJhKzpJwkRICo2tF
	 ZY7cgGs6oIcHeX5tqIxyyrmKMRcu6Yjr1B+Le5Xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB72FF80526;
	Thu, 25 Aug 2022 13:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F9A0F800C8; Thu, 25 Aug 2022 12:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D60C5F800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 12:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60C5F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vanalboom.org header.i=@vanalboom.org
 header.b="J6ICCJGf"
Date: Thu, 25 Aug 2022 10:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vanalboom.org;
 s=protonmail3; t=1661424338; x=1661683538;
 bh=ycmmXB2xkW3L4MLIAcRGwnrqiQ3cJHENzNeGekjo/XM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=J6ICCJGfSIXEC59My989bUKLj1S0q9sm4ErV2iXdxUDNS3beq/dxAOrgjtphcgmXy
 R+xgq0bwW9HN+hEgSZNhLI9fbCup3qe19DUUeQ/9cEIisPCMo6qN0a1FKbH+CafjDW
 nvB/plNz89k8PIYW1gurZqUcELbacZiV68mA8Bblsd7Mful2VybsC15snxMdPabUoO
 C6FWPmps3+0a2vxooG3Y3FCoVCwyzBymvnKtYj8IkXICGlxSgqGMKHCdfRjgiGWaLC
 ohp0fYBFmP141vmQQZeyvKPI4Dpgx7YdYeNRfvvpW+fJsWbsOIuWcfS+fgPVZ3gfVP
 YVpp8c9fBJTSw==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Lennert Van Alboom <lennert@vanalboom.org>
Subject: USB DAC broken since commit bf6313a0ff766925462e97b4e733d5952de02367
 (5.10.0-rc5)
Message-ID: <T3VPXtCc4uFws9Gfh2RjX6OdwM1RqfC6VqQr--_LMDyB2x5N3p9_q6AtPna17IXhHwBtcJVdXuS80ZZSCMjh_BafIbnzJPhbrkmhmWS6DlI=@vanalboom.org>
Feedback-ID: 20549952:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------fe817db9f0a742efaf05bebc48e8e0eda91efed39bb53158bc0696c060578cbf";
 charset=utf-8
X-Mailman-Approved-At: Thu, 25 Aug 2022 13:31:12 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Reply-To: Lennert Van Alboom <lennert@vanalboom.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------fe817db9f0a742efaf05bebc48e8e0eda91efed39bb53158bc0696c060578cbf
Content-Type: multipart/mixed;boundary=---------------------16decedfebcd9fb067f135b12be6f8ff

-----------------------16decedfebcd9fb067f135b12be6f8ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,


My USB DAC fails to work on recent kernels (anything past 5.10). The devic=
e is the following:

Bus 003 Device 005: ID 2522:0007 LH Labs Geek Out HD Audio 1V5



Syslog shows error messages which have changed over the different kernel v=
ersions - this is the output from debian's 5.17.0-2-amd64:

[66136.185642] usb 3-6: uac_clock_source_is_valid(): cannot get clock vali=
dity for id 41
[66136.185643] usb 3-6: clock source 41 is not valid, cannot use
[66136.185956] usb 3-6: 1:0: usb_set_interface failed (-71)
[66136.186183] usb 3-6: 1:0: usb_set_interface failed (-71)


From the first point in git where it fails (5.10.0-rc5-00025-gbf6313a0ff76=
):

Aug 25 12:39:37 Nesbitt kernel: [ 5295.633079] usb 3-3: new high-speed USB=
 device number 8 using xhci_hcd
Aug 25 12:39:37 Nesbitt kernel: [ 5295.782144] usb 3-3: New USB device fou=
nd, idVendor=3D2522, idProduct=3D0007, bcdDevice=3D15.02
Aug 25 12:39:37 Nesbitt kernel: [ 5295.782148] usb 3-3: New USB device str=
ings: Mfr=3D1, Product=3D3, SerialNumber=3D0
Aug 25 12:39:37 Nesbitt kernel: [ 5295.782150] usb 3-3: Product: Geek Out =
HD Audio 1V5
Aug 25 12:39:37 Nesbitt kernel: [ 5295.782151] usb 3-3: Manufacturer: LH L=
abs
Aug 25 12:39:37 Nesbitt kernel: [ 5296.162338] usb 3-3: 1:2 : unsupported =
format bits 0x100000000
Aug 25 12:39:38 Nesbitt mtp-probe: checking bus 3, device 8: "/sys/devices=
/pci0000:00/0000:00:14.0/usb3/3-3"
Aug 25 12:39:38 Nesbitt mtp-probe: bus: 3, device: 8 was not an MTP device
Aug 25 12:39:38 Nesbitt systemd-udevd[10311]: controlC1: Process '/usr/sbi=
n/alsactl -E HOME=3D/run/alsa -E XDG_RUNTIME_DIR=3D/run/alsa/runtime resto=
re 1' failed with exit code 99.
Aug 25 12:39:38 Nesbitt mtp-probe: checking bus 3, device 8: "/sys/devices=
/pci0000:00/0000:00:14.0/usb3/3-3"
Aug 25 12:39:38 Nesbitt mtp-probe: bus: 3, device: 8 was not an MTP device
Aug 25 12:39:43 Nesbitt kernel: [ 5301.921810] usb 3-3: 1:1: usb_set_inter=
face failed (-110)
Aug 25 12:39:43 Nesbitt kernel: [ 5301.922047] usb 3-3: 1:0: usb_set_inter=
face failed (-71)
Aug 25 12:39:43 Nesbitt kernel: [ 5301.922354] usb 3-3: 1:0: usb_set_inter=
face failed (-71)
Aug 25 12:39:43 Nesbitt kernel: [ 5301.922915] usb 3-3: 1:0: usb_set_inter=
face failed (-71)


I did a git bisect (from kernel source, not on debian-specific) and the of=
fending commit has been found:

# git bisect bad
bf6313a0ff766925462e97b4e733d5952de02367 is the first bad commit
commit bf6313a0ff766925462e97b4e733d5952de02367
Author: Takashi Iwai <tiwai@suse.de>
Date:   Mon Nov 23 09:53:31 2020 +0100

    ALSA: usb-audio: Refactor endpoint management
    =


    This is an intensive surgery for the endpoint and stream management
    for achieving more robust and clean code.
    =


    The goals of this patch are:
    - More clear endpoint resource changes
    - The interface altsetting control in a single place
    Below are brief description of the whole changes.
    =


    First off, most of the endpoint operations are moved into endpoint.c,
    so that the snd_usb_endpoint object is only referred in other places.
    The endpoint object is acquired and released via the new functions
    snd_usb_endpoint_open() and snd_usb_endpoint_close() that are called
    at PCM hw_params and hw_free callbacks, respectively.  Those are
    ref-counted and EPs can manage the multiple opens.
    =


    The open callback receives the audioformat and hw_params arguments,
    and those are used for initializing the EP parameters; especially the
    endpoint, interface and altset numbers are read from there, as well as
    the PCM parameters like the format, rate and channels.  Those are
    stored in snd_usb_endpoint object.  If it's the secondary open, the
    function checks whether the given parameters are compatible with the
    already opened EP setup, too.
    =


    The coupling with a sync EP (including an implicit feedback sync) is
    done by the sole snd_usb_endpoint_set_sync() call.
    =


    The configuration of each endpoint is done in a single shot via
    snd_usb_endpoint_configure() call.  This is the place where most of
    PCM configurations are done.  A few flags and special handling in the
    snd_usb_substream are dropped along with this change.
    =


    A significant difference wrt the configuration from the previous code
    is the order of USB host interface setups.  Now the interface is
    always disabled at beginning and (re-)enabled at the last step of
    snd_usb_endpoint_configure(), in order to be compliant with the
    standard UAC2/3.  For UAC1, the interface is set before the parameter
    setups since there seem devices that require it (e.g. Yamaha THR10),
    just like how it was done in the previous driver code.
    =


    The start/stop are almost same as before, also single-shots.  The URB
    callbacks need to be set via snd_usb_endpoint_set_callback() like the
    previous code at the trigger phase, too.
    =


    Finally, the flag for the re-setup is set at the device suspend
    through the full EP list, instead of PCM trigger.  This catches the
    overlooked cases where the PCM hasn't been running yet but the device
    needs the full setup after resume.
    =


    Tested-by: Keith Milner <kamilner@superlative.org>
    Tested-by: Dylan Robinson <dylan_robinson@motu.com>
    Link: https://lore.kernel.org/r/20201123085347.19667-26-tiwai@suse.de
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

 sound/usb/card.c     |   8 +-
 sound/usb/card.h     |  11 +-
 sound/usb/clock.c    |  13 +-
 sound/usb/endpoint.c | 662 ++++++++++++++++++++++++++--------------------=
-----
 sound/usb/endpoint.h |  40 ++--
 sound/usb/pcm.c      | 616 +++++++++++++++++++---------------------------=
-
 6 files changed, 616 insertions(+), 734 deletions(-)


That's a lot of code though. I'd like to be able to use my DAC on kernels =
newer than 5.10 so any hints on how to debug and fix this would be greatly=
 appreciated. After doing this 17-point bisect I absolutely don't mind bui=
lding a few more to fix this.

For info, the debian bug report: https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D1011196 =


For info, a related report from Arch linux for the same device vendor: htt=
ps://bugs.archlinux.org/task/70636


Thanks,


Lennert
-----------------------16decedfebcd9fb067f135b12be6f8ff
Content-Type: application/pgp-keys; filename="publickey - lennert@vanalboom.org - 0x0320C886.asc"; name="publickey - lennert@vanalboom.org - 0x0320C886.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - lennert@vanalboom.org - 0x0320C886.asc"; name="publickey - lennert@vanalboom.org - 0x0320C886.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWHBHZWNoWUpLd1lCQkFI
YVJ3OEJBUWRBSFBRaWM5VER0TURQaDgwclllNFlDRHh5aEFTdkhMcUcKb1NTQWMwRGNaVGJOTFd4
bGJtNWxjblJBZG1GdVlXeGliMjl0TG05eVp5QThiR1Z1Ym1WeWRFQjJZVzVoCmJHSnZiMjB1YjNK
blBzSjRCQkFXQ2dBZ0JRSmVrWjV5QmdzSkJ3Z0RBZ1FWQ0FvQ0JCWUNBUUFDR1FFQwpHd01DSGdF
QUNna1FmdENYYy9pU21tNE5IZ0QrTUdVQ2hkZHdRckw4R3hGZVlmVFRLSVJiQ2huVTgvK1MKVU8z
SE1ZdmlnUDRBLzFFdVRhU1RQMU5jVUJkRllvU2pqU2gzQWE2Zis3dFRISXN2TWl0TGF5NEx6amdF
ClhwR2VjaElLS3dZQkJBR1hWUUVGQVFFSFFOTlR3dG11TGpqOXJNZnhOaUtUZ0JyWVNmY3lEVDRX
U1grdQpZY1l3RWdCQUF3RUlCOEpoQkJnV0NBQUpCUUpla1o1eUFoc01BQW9KRUg3UWwzUDRrcHB1
TUlJQkFLMEQKc2g3alVsUHBWTUlzTVdZRDZETkhmaVFEZXcwQVh1WjJhd0JvWEtjRkFQOWJZZkpR
M29ENTNpelNLYkpFCmlLQkh1Y2pDOWJmRzlOcjdsdFA3OHNZN0NnPT0KPXpraXYKLS0tLS1FTkQg
UEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=
-----------------------16decedfebcd9fb067f135b12be6f8ff--

--------fe817db9f0a742efaf05bebc48e8e0eda91efed39bb53158bc0696c060578cbf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKAAYFAmMHUrUAIQkQftCXc/iSmm4WIQQDIMiGf8zUXWpveld+0Jdz
+JKabsugAQDG0KuWIk30OfVBFAoJrKm54dqLQpv+YamEStA9qlccqgEAivzk
cr9ptrurxNGKws2gFcTy7AGkyK2oJuZsyxzNLgw=
=/m6U
-----END PGP SIGNATURE-----


--------fe817db9f0a742efaf05bebc48e8e0eda91efed39bb53158bc0696c060578cbf--

