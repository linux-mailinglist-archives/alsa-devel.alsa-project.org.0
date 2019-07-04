Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77071601FD
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 10:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8EE16A1;
	Fri,  5 Jul 2019 10:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8EE16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562314620;
	bh=t03ut8RC8iAEai6Y42oFtyf/GeWpqLznLfGtAr+Ur6M=;
	h=In-Reply-To:References:From:To:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s/3cq4Di2zcW9FXa8wlJ/guxsm0M5/1FJSrFk3j4U4jCAfIVspjudxk0lKMNj6lli
	 LlxeSYQPqyxDmwPsmZMkdohA2Z6SzEq7mUWyOhlRyVk0GHp135OvLD0DI0TZ+n/S8P
	 lhmcXEB4R4GYPAXUclfKxeXMaraNx+xZuDs09qrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3392AF80120;
	Fri,  5 Jul 2019 10:15:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B1CF80111; Thu,  4 Jul 2019 15:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7548F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 15:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7548F800E7
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 58F4F2005D2;
 Thu,  4 Jul 2019 15:33:58 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 49DAA200D9D;
 Thu,  4 Jul 2019 15:33:58 +0200 (CEST)
Received: from [127.0.1.1] (gw_auto.ea.freescale.net [10.171.94.100])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id F3891205D9;
 Thu,  4 Jul 2019 15:33:57 +0200 (CEST)
MIME-Version: 1.0
In-Reply-To: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
References: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
Thread-Topic: [PATCH] MLK-22197 sound: asoc: add micfil dc remover amixer
 control
Thread-Index: AQHVMmdGkhP8uUk46U+4u9g/h8BbSw==
From: jana.build@nxp.com
To: Irina Patru <ioana-irina.patru@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-Id: <20190704133404.B0B1CF80111@alsa1.perex.cz>
Date: Thu,  4 Jul 2019 15:34:04 +0200 (CEST)
X-Mailman-Approved-At: Fri, 05 Jul 2019 10:15:13 +0200
Cc: Irina Patru <ioana-irina.patru@nxp.com>, alsa-devel@alsa-project.org,
 Daniel Baluta <daniel.baluta@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [alsa-devel] [PATCH] MLK-22197 sound: asoc: add micfil dc
	remover amixer control
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

Checkout project linux-imx      
Checkout branch imx_4.14.y      ok 
Checkpatch:                ok 
Apply patch(es):           ok 
Pushed to build server:            ok [https://jana.ea.freescale.net/jenkins//blue/organizations/jenkins/kernel-build-email/detail/kernel-build-email/2692/pipeline]
Build:                ok 
Tests:                FAILED [imx6dl-sabreauto imx6ulz-14x14-evk imx6dl-sabreauto imx6ulz-14x14-evk imx8mq imx8qm-mek imx8qm-val imx8mq imx8qm-mek imx8qm-val imx6sll-evk/bat-cpuidle-sleeptime imx6ull-14x14-evk/bat-cpuidle-sleeptime imx7ulp-evk/bat-audio-probe imx7ulp-evk/bat-cpufreq-freq-check imx7ulp-evk/bat-cpufreq imx7ulp-evk/bat-rtc imx7ulp-evk/bat-uart imx7ulp-evk/bat-suspend imx6ul-14x14-evk/jana_IMX6-debug_cmd-output-imx6ul-14x14-evk_log imx6ull-14x14-evk/jana_IMX6-debug_cmd-output-imx6ull-14x14-evk_log imx7ulp-evk/bat-audio-probe imx7ulp-evk/bat-bootcheck imx7ulp-evk/bat-cpufreq-freq-check imx7ulp-evk/bat-cpufreq imx7ulp-evk/bat-rtc imx7ulp-evk/bat-uart imx7ulp-evk/bat-suspend imx8mm-evk/bat-devicetree imx8qxp-mek/bat-devicetree imx8mm-evk/bat-devicetree imx8qxp-mek/bat-bootcheck imx8qxp-mek/bat-devicetree]
TODOs:
    * imx8qxp-mek: [bat-cpuidle]
    * imx8qxp-mek: [bat-cpuidle]






test errors:

imx6sll-evk/bat-cpuidle-sleeptime: not ok 27 bat-cpuidle-sleeptime.sh
run 27 bat-cpuidle-sleeptime.sh
reexec ./bat-cpuidle-sleeptime.sh inside ramroot...
cleaning up ramroot
not ok 27 bat-cpuidle-sleeptime.sh

imx6ull-14x14-evk/bat-cpuidle-sleeptime: not ok 27 bat-cpuidle-sleeptime.sh
run 27 bat-cpuidle-sleeptime.sh
reexec ./bat-cpuidle-sleeptime.sh inside ramroot...
cleaning up ramroot
not ok 27 bat-cpuidle-sleeptime.sh

imx7ulp-evk/bat-audio-probe: not ok 3 bat-audio-probe.sh
run 3 bat-audio-probe.sh
Available audio cards: 0 expected: 1
machine: NXP i.MX7ULP EVK
cards:

--- no soundcards ---
not ok 3 bat-audio-probe.sh

imx7ulp-evk/bat-cpufreq-freq-check: not ok 8 bat-cpufreq-freq-check.sh
run 8 bat-cpufreq-freq-check.sh
cat: /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: No such file or directory
not ok 8 bat-cpufreq-freq-check.sh

imx7ulp-evk/bat-cpufreq: not ok 9 bat-cpufreq.sh
run 9 bat-cpufreq.sh
cat: /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: No such file or directory
not ok 9 bat-cpufreq.sh

imx7ulp-evk/bat-rtc: not ok 19 bat-rtc.sh
run 19 bat-rtc.sh
./bat-rtc.sh: line 63: [: 0: unary operator expected
irq missmatch: got 0 , expected 
not ok 19 bat-rtc.sh

imx7ulp-evk/bat-uart: not ok 24 bat-uart.sh
run 24 bat-uart.sh
checking uart ttyLP2 driver fsl-lpuart
Test: loopback test for /dev/ttyLP2

---- Running < /unit_tests/BAT/../UART/mxc_uart_test.out > test ----

/dev/ttyLP2 opened
Attributes set
Test: IOCTL Set
Data Written= Test
Data Read back= 
Data read back  is different than data sent Test

----  Test < /dev/ttyLP2 > ended  ----

not ok 24 bat-uart.sh

imx7ulp-evk/bat-suspend: not ok 26 bat-suspend.sh
run 26 bat-suspend.sh
read rtc time: Invalid argument

---- Running < /unit_tests/BAT/../SRTC/rtcwakeup.out > test ----

not ok 26 bat-suspend.sh

imx6ul-14x14-evk/jana_IMX6-debug_cmd-output-imx6ul-14x14-evk_log: Looks like you planned 27 tests but ran 26.
Last running test was:
run 27 bat-cpuidle-sleeptime.sh

imx6ull-14x14-evk/jana_IMX6-debug_cmd-output-imx6ull-14x14-evk_log: Looks like you planned 27 tests but ran 26.
Last running test was:
run 27 bat-cpuidle-sleeptime.sh

imx7ulp-evk/bat-audio-probe: not ok 3 bat-audio-probe.sh
run 3 bat-audio-probe.sh
Available audio cards: 0 expected: 1
machine: NXP i.MX7ULP EVK
cards:

--- no soundcards ---
not ok 3 bat-audio-probe.sh

imx7ulp-evk/bat-bootcheck: not ok 6 bat-bootcheck.sh
run 6 bat-bootcheck.sh
[   11.789005] using random host ethernet address
[   11.818461] usb0: HOST MAC 66:3a:1f:52:7b:e3
[   11.823984] usb0: MAC 1a:4a:38:81:5b:51

[   11.834612] ================================
[   11.837580] WARNING: inconsistent lock state
[   11.840552] 4.14.98-debug-g9bad3a9 #1 Not tainted
[   11.843950] --------------------------------
[   11.846917] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
[   11.851623] linuxrc/159 [HC1[1]:SC0[0]:HE0:SE1] takes:
[   11.855452]  (&(&ci->lock)->rlock){?.+.}, at: [<806b982c>] ci_irq+0x1c/0x180
[   11.861233] {HARDIRQ-ON-W} state was registered at:
[   11.864814]   _raw_spin_lock+0x38/0x48
[   11.867264]   ci_controller_resume+0x84/0x16c
[   11.870323]   __rpm_callback+0x144/0x220
[   11.872946]   rpm_callback+0x54/0x80
[   11.875225]   rpm_resume+0x4b0/0x648
[   11.877505]   __pm_runtime_resume+0x60/0x98
[   11.880392]   ci_hdrc_gadget_connect+0x24/0x17c
[   11.883623]   ci_udc_start+0x78/0x88
[   11.885904]   udc_bind_to_driver+0x7c/0xf0
[   11.888702]   usb_gadget_probe_driver+0xa4/0x168
[   11.892021]   gadget_dev_desc_UDC_store+0xa8/0xd0
[   11.895428]   configfs_write_file+0xe8/0x1a4
[   11.898403]   __vfs_write+0x1c/0x128
[   11.900680]   vfs_write+0xa4/0x168
Found WARN during boot
not ok 6 bat-bootcheck.sh

imx7ulp-evk/bat-cpufreq-freq-check: not ok 8 bat-cpufreq-freq-check.sh
run 8 bat-cpufreq-freq-check.sh
cat: /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: No such file or directory
not ok 8 bat-cpufreq-freq-check.sh

imx7ulp-evk/bat-cpufreq: not ok 9 bat-cpufreq.sh
run 9 bat-cpufreq.sh
cat: /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: No such file or directory
not ok 9 bat-cpufreq.sh

imx7ulp-evk/bat-rtc: not ok 19 bat-rtc.sh
run 19 bat-rtc.sh
./bat-rtc.sh: line 63: [: 0: unary operator expected
irq missmatch: got 0 , expected 
not ok 19 bat-rtc.sh

imx7ulp-evk/bat-uart: not ok 24 bat-uart.sh
run 24 bat-uart.sh
checking uart ttyLP2 driver fsl-lpuart
Test: loopback test for /dev/ttyLP2

---- Running < /unit_tests/BAT/../UART/mxc_uart_test.out > test ----

/dev/ttyLP2 opened
Attributes set
Test: IOCTL Set
Data Written= Test
Data Read back= 
Data read back  is different than data sent Test

----  Test < /dev/ttyLP2 > ended  ----

not ok 24 bat-uart.sh

imx7ulp-evk/bat-suspend: not ok 26 bat-suspend.sh
run 26 bat-suspend.sh
read rtc time: Invalid argument

---- Running < /unit_tests/BAT/../SRTC/rtcwakeup.out > test ----

not ok 26 bat-suspend.sh

imx8mm-evk/bat-devicetree: not ok 12 bat-devicetree.sh
run 12 bat-devicetree.sh
./bat-devicetree.sh: line 16: read: read error: 0: Is a directory
devicetree contains 141 devices, 20 disabled
accept unbound /sys/firmware/devicetree/base/clock-controller@30380000
accept unbound /sys/firmware/devicetree/base/clocks/clock@0
accept unbound /sys/firmware/devicetree/base/clocks/clock@1
accept unbound /sys/firmware/devicetree/base/clocks/clock@2
accept unbound /sys/firmware/devicetree/base/clocks/clock@3
accept unbound /sys/firmware/devicetree/base/clocks/clock@4
accept unbound /sys/firmware/devicetree/base/clocks/clock@5
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cluster-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cpu-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/l2-cache0
accept unbound /sys/firmware/devicetree/base/gpc@303a0000
accept unbound /sys/firmware/devicetree/base/interrupt-controller@38800000
unbound device node /sys/firmware/devicetree/base/lcdif-resets/lcdif-clk-enable compatible: lcdif,clk-enable
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-clk-enable compatible: dsi,clk-enable
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-mipi-reset compatible: dsi,mipi-reset
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-soft-resetn compatible: dsi,soft-resetn
accept unbound /sys/firmware/devicetree/base/reserved-memory/linux,cma
Found 4 unbound devices
not ok 12 bat-devicetree.sh

imx8qxp-mek/bat-devicetree: not ok 12 bat-devicetree.sh
run 12 bat-devicetree.sh
devicetree contains 214 devices, 37 disabled
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cluster-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cpu-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/l2-cache0
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/audio_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/caam_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/cm40_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/connectivity_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/dc0_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/dma_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/gpu-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/hsio-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/imaging_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/lsio_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/vpu-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/interrupt-controller@51a00000
accept unbound /sys/firmware/devicetree/base/reserved-memory/linux,cma
unbound device node /sys/firmware/devicetree/base/reserved-memory/rpmsg_dma@0x90400000 compatible: shared-dma-pool
unbound device node /sys/firmware/devicetree/base/vpu_encoder@2d000000/core0@1020000 compatible: fsl,imx8-mu1-vpu-m0
accept unbound /sys/firmware/devicetree/base/wu compat fsl,imx8-wu
Found 2 unbound devices
not ok 12 bat-devicetree.sh

imx8mm-evk/bat-devicetree: not ok 12 bat-devicetree.sh
run 12 bat-devicetree.sh
./bat-devicetree.sh: line 16: read: read error: 0: Is a directory
devicetree contains 141 devices, 20 disabled
accept unbound /sys/firmware/devicetree/base/clock-controller@30380000
accept unbound /sys/firmware/devicetree/base/clocks/clock@0
accept unbound /sys/firmware/devicetree/base/clocks/clock@1
accept unbound /sys/firmware/devicetree/base/clocks/clock@2
accept unbound /sys/firmware/devicetree/base/clocks/clock@3
accept unbound /sys/firmware/devicetree/base/clocks/clock@4
accept unbound /sys/firmware/devicetree/base/clocks/clock@5
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cluster-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cpu-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/l2-cache0
accept unbound /sys/firmware/devicetree/base/gpc@303a0000
accept unbound /sys/firmware/devicetree/base/interrupt-controller@38800000
unbound device node /sys/firmware/devicetree/base/lcdif-resets/lcdif-clk-enable compatible: lcdif,clk-enable
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-clk-enable compatible: dsi,clk-enable
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-mipi-reset compatible: dsi,mipi-reset
unbound device node /sys/firmware/devicetree/base/mipi-dsi-resets/dsi-soft-resetn compatible: dsi,soft-resetn
accept unbound /sys/firmware/devicetree/base/reserved-memory/linux,cma
Found 4 unbound devices
not ok 12 bat-devicetree.sh

imx8qxp-mek/bat-bootcheck: not ok 6 bat-bootcheck.sh
run 6 bat-bootcheck.sh
[    0.611812] libata version 3.00 loaded.
[    0.612612] usbcore: registered new interface driver usbfs
[    0.612795] usbcore: registered new interface driver hub
[    0.613070] usbcore: registered new device driver usb
[    0.614440] usb_phy_generic usbphynop1: usbphynop1 supply vcc not found, using dummy regulator
[    0.619581] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    0.619627] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[    0.619643] 3 locks held by swapper/0/1:
[    0.619657]  #0:  (&dev->mutex){....}, at: [<ffff00000871d9f8>] __driver_attach+0x50/0xc8
[    0.619711]  #1:  (&dev->mutex){....}, at: [<ffff00000871da08>] __driver_attach+0x60/0xc8
[    0.619747]  #2:  (enable_lock){....}, at: [<ffff0000085a2a0c>] clk_enable_lock+0x2c/0xf0
[    0.619793] irq event stamp: 149972
[    0.619814] hardirqs last  enabled at (149971): [<ffff000008e677d4>] _raw_spin_unlock_irqrestore+0x6c/0x78
[    0.619832] hardirqs last disabled at (149972): [<ffff0000085a2a00>] clk_enable_lock+0x20/0xf0
[    0.619850] softirqs last  enabled at (148118): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    0.619869] softirqs last disabled at (148111): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    0.619888] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.98-debug-g9bad3a9 #1
[    0.619902] Hardware name: Freescale i.MX8QXP MEK (DT)
[    0.619916] Call trace:
[    0.619935] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    0.619952] [<ffff00000808a87c>] show_stack+0x14/0x20
[    0.619974] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    0.619993] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    0.620008] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    0.620027] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[    0.620041] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
--
[    2.274572] io scheduler noop registered
[    2.274977] io scheduler cfq registered (default)
[    2.274994] io scheduler mq-deadline registered
[    2.275008] io scheduler kyber registered
[    2.330850] pwm-backlight lvds_backlight@0: lvds_backlight@0 supply power not found, using dummy regulator
[    2.331746] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    2.331799] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[    2.331815] 4 locks held by swapper/0/1:
[    2.331829]  #0:  (&dev->mutex){....}, at: [<ffff00000871d9f8>] __driver_attach+0x50/0xc8
[    2.331882]  #1:  (&dev->mutex){....}, at: [<ffff00000871da08>] __driver_attach+0x60/0xc8
[    2.331920]  #2:  (&new_bd->update_lock){+.+.}, at: [<ffff0000085431fc>] pwm_backlight_probe+0x3ec/0x4f8
[    2.331965]  #3:  (enable_lock){....}, at: [<ffff0000085a2a0c>] clk_enable_lock+0x2c/0xf0
[    2.332012] irq event stamp: 211452
[    2.332032] hardirqs last  enabled at (211451): [<ffff000008e6780c>] _raw_spin_unlock_irq+0x2c/0x60
[    2.332050] hardirqs last disabled at (211452): [<ffff0000085a2a00>] clk_enable_lock+0x20/0xf0
[    2.332070] softirqs last  enabled at (211436): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    2.332089] softirqs last disabled at (211429): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    2.332108] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    2.332122] Hardware name: Freescale i.MX8QXP MEK (DT)
[    2.332136] Call trace:
[    2.332155] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    2.332172] [<ffff00000808a87c>] show_stack+0x14/0x20
[    2.332192] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    2.332211] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    2.332226] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    2.332243] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
--
[    2.400646] msm_serial: driver initialized
[    2.403877] 5a060000.serial: ttyLP0 at MMIO 0x5a060010 (irq = 63, base_baud = 5000000) is a FSL_LPUART
[    4.159910] console [ttyLP0] enabled
[    4.164802] fsl-lpuart 5a060000.serial: NO DMA tx channel, run at cpu mode
[    4.171755] fsl-lpuart 5a060000.serial: NO DMA rx channel, run at cpu mode
[    4.180337] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    4.188814] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[    4.195614] 3 locks held by swapper/0/1:
[    4.199546]  #0:  (&dev->mutex){....}, at: [<ffff00000871d9f8>] __driver_attach+0x50/0xc8
[    4.207772]  #1:  (&dev->mutex){....}, at: [<ffff00000871da08>] __driver_attach+0x60/0xc8
[    4.215982]  #2:  (enable_lock){....}, at: [<ffff0000085a2a0c>] clk_enable_lock+0x2c/0xf0
[    4.224203] irq event stamp: 258948
[    4.227703] hardirqs last  enabled at (258947): [<ffff000008e677d4>] _raw_spin_unlock_irqrestore+0x6c/0x78
[    4.237367] hardirqs last disabled at (258948): [<ffff0000085a2a00>] clk_enable_lock+0x20/0xf0
[    4.245997] softirqs last  enabled at (258732): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    4.254537] softirqs last disabled at (258711): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    4.262642] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    4.271176] Hardware name: Freescale i.MX8QXP MEK (DT)
[    4.276320] Call trace:
[    4.278774] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    4.284185] [<ffff00000808a87c>] show_stack+0x14/0x20
[    4.289252] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    4.294317] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    4.299898] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    4.305215] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[    4.310531] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
--
[    5.371102] IR SANYO protocol handler initialized
[    5.375844] IR Sharp protocol handler initialized
[    5.380589] IR MCE Keyboard/mouse protocol handler initialized
[    5.386459] IR XMP protocol handler initialized
[    5.394962] mxc-isi 58100000.isi: can't find isi-gpr property
[    5.400880] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    5.409328] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[    5.416130] 3 locks held by swapper/0/1:
[    5.420054]  #0:  (&dev->mutex){....}, at: [<ffff00000871d9f8>] __driver_attach+0x50/0xc8
[    5.428279]  #1:  (&dev->mutex){....}, at: [<ffff00000871da08>] __driver_attach+0x60/0xc8
[    5.436488]  #2:  (enable_lock){....}, at: [<ffff0000085a2a0c>] clk_enable_lock+0x2c/0xf0
[    5.444710] irq event stamp: 366880
[    5.448210] hardirqs last  enabled at (366879): [<ffff000008e677d4>] _raw_spin_unlock_irqrestore+0x6c/0x78
[    5.457875] hardirqs last disabled at (366880): [<ffff0000085a2a00>] clk_enable_lock+0x20/0xf0
[    5.466504] softirqs last  enabled at (366864): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    5.475044] softirqs last disabled at (366843): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    5.483148] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    5.491683] Hardware name: Freescale i.MX8QXP MEK (DT)
[    5.496827] Call trace:
[    5.499281] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    5.504692] [<ffff00000808a87c>] show_stack+0x14/0x20
[    5.509759] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    5.514824] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    5.520405] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    5.525732] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[    5.531056] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
--
[    6.923500] usbhid: USB HID core driver
[    6.936254] tcpci 20-0050: Log buffer index 5 is NULL
[    6.979977] cs42xx8 17-0048: failed to get device ID, ret = -5
[    6.987670] cs42xx8: probe of 17-0048 failed with error -5
[    7.004908] ***** imx8qm_acm_init *****
[    7.012820] BUG: looking up invalid subclass: 8
[    7.017363] turning off the locking correctness validator.
[    7.022859] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    7.031392] Hardware name: Freescale i.MX8QXP MEK (DT)
[    7.036536] Call trace:
[    7.038998] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    7.044402] [<ffff00000808a87c>] show_stack+0x14/0x20
[    7.049460] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    7.054514] [<ffff00000811ffc4>] register_lock_class+0x28c/0x528
[    7.060525] [<ffff000008122eb0>] __lock_acquire+0x78/0x1788
[    7.066099] [<ffff000008124c04>] lock_acquire+0x44/0x60
[    7.071334] [<ffff000008e63518>] __mutex_lock+0x78/0x868
[    7.076646] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
[    7.082315] [<ffff000008732378>] genpd_lock_nested_mtx+0x10/0x18
[    7.088326] [<ffff000008734b9c>] genpd_power_on.part.9+0x6c/0x1c8
[    7.094421] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
[    7.100520] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
[    7.106618] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
[    7.112719] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
[    7.118818] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
[    7.124914] [<ffff000008734bb0>] genpd_power_on.part.9+0x80/0x1c8
--
[    7.194714] [<ffff00000953fe40>] fsl_asrc_driver_init+0x18/0x20
[    7.200637] [<ffff000008083c08>] do_one_initcall+0x38/0x120
[    7.206215] [<ffff0000094e0d50>] kernel_init_freeable+0x1d0/0x264
[    7.212312] [<ffff000008e60254>] kernel_init+0x10/0xfc
[    7.217455] [<ffff000008085048>] ret_from_fork+0x10/0x18
[    7.255082] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    7.263533] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[    7.270325] INFO: lockdep is turned off.
[    7.274252] irq event stamp: 471395
[    7.277758] hardirqs last  enabled at (471395): [<ffff000008e6780c>] _raw_spin_unlock_irq+0x2c/0x60
[    7.286818] hardirqs last disabled at (471394): [<ffff000008e6760c>] _raw_spin_lock_irq+0x1c/0x60
[    7.295707] softirqs last  enabled at (470966): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    7.304246] softirqs last disabled at (470957): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    7.312343] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    7.320869] Hardware name: Freescale i.MX8QXP MEK (DT)
[    7.326013] Call trace:
[    7.328468] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    7.333878] [<ffff00000808a87c>] show_stack+0x14/0x20
[    7.338937] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    7.344001] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    7.349576] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    7.354892] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[    7.360209] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
[    7.365877] [<ffff0000087344a8>] genpd_get_from_provider.part.10+0x30/0xa0
[    7.372761] [<ffff000008734528>] genpd_get_from_provider+0x10/0x20
[    7.378950] [<ffff0000085ba264>] populate_gate_pd.isra.1+0x34/0x50
--
[    8.431494] imx-drm display-subsystem: bound ldb@562410e0 (ops imx_ldb_ops)
[    8.438639] nwl_dsi-imx mipi_dsi@56248000: No bridge found, skipping encoder creation
[    8.446509] imx-drm display-subsystem: bound mipi_dsi@56248000 (ops imx_nwl_dsi_component_ops)
[    8.455194] [drm] Cannot find any crtc or sizes
[    8.460525] [drm] Initialized imx-drm 1.0.0 20120507 for display-subsystem on minor 0
[    8.482138] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[    8.490592] in_atomic(): 1, irqs_disabled(): 128, pid: 3, name: kworker/0:0
[    8.497556] INFO: lockdep is turned off.
[    8.501483] irq event stamp: 7070
[    8.504816] hardirqs last  enabled at (7069): [<ffff000008e6780c>] _raw_spin_unlock_irq+0x2c/0x60
[    8.513702] hardirqs last disabled at (7070): [<ffff000008e61970>] __schedule+0xb8/0x750
[    8.521800] softirqs last  enabled at (3660): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[    8.530157] softirqs last disabled at (3635): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[    8.538089] CPU: 0 PID: 3 Comm: kworker/0:0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[    8.546788] Hardware name: Freescale i.MX8QXP MEK (DT)
[    8.551939] Workqueue: events deferred_probe_work_func
[    8.557083] Call trace:
[    8.559540] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[    8.564949] [<ffff00000808a87c>] show_stack+0x14/0x20
[    8.570007] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[    8.575072] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[    8.580644] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[    8.585961] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[    8.591278] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
[    8.596947] [<ffff0000087344a8>] genpd_get_from_provider.part.10+0x30/0xa0
[    8.603832] [<ffff000008734528>] genpd_get_from_provider+0x10/0x20
--
[   13.036504] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   13.051557] IP-Config: Complete:
[   13.054799]      device=eth0, hwaddr=00:04:9f:05:57:16, ipaddr=192.168.0.18, mask=255.255.255.0, gw=192.168.0.1
[   13.064923]      host=imx8qxp-mek-0, domain=, nis-domain=(none)
[   13.070870]      bootserver=255.255.255.255, rootserver=192.168.0.1, rootpath=
[   13.078416] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747
[   13.086860] in_atomic(): 1, irqs_disabled(): 128, pid: 1, name: swapper/0
[   13.093652] INFO: lockdep is turned off.
[   13.097579] irq event stamp: 471395
[   13.101084] hardirqs last  enabled at (471395): [<ffff000008e6780c>] _raw_spin_unlock_irq+0x2c/0x60
[   13.110136] hardirqs last disabled at (471394): [<ffff000008e6760c>] _raw_spin_lock_irq+0x1c/0x60
[   13.119017] softirqs last  enabled at (470966): [<ffff000008081ccc>] __do_softirq+0x23c/0x288
[   13.127556] softirqs last disabled at (470957): [<ffff0000080d63ac>] irq_exit+0xdc/0x100
[   13.135661] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W       4.14.98-debug-g9bad3a9 #1
[   13.144187] Hardware name: Freescale i.MX8QXP MEK (DT)
[   13.149331] Call trace:
[   13.151786] [<ffff00000808a4b0>] dump_backtrace+0x0/0x3b8
[   13.157196] [<ffff00000808a87c>] show_stack+0x14/0x20
[   13.162255] [<ffff000008e4da48>] dump_stack+0xbc/0xf4
[   13.167319] [<ffff0000080fb924>] ___might_sleep+0x144/0x1d8
[   13.172900] [<ffff0000080fba08>] __might_sleep+0x50/0x88
[   13.178219] [<ffff000008e634e8>] __mutex_lock+0x48/0x868
[   13.183533] [<ffff000008e63d24>] mutex_lock_nested+0x1c/0x28
[   13.189204] [<ffff0000087344a8>] genpd_get_from_provider.part.10+0x30/0xa0
[   13.196087] [<ffff000008734528>] genpd_get_from_provider+0x10/0x20
[   13.202275] [<ffff0000085ba264>] populate_gate_pd.isra.1+0x34/0x50
Found BUG during boot
not ok 6 bat-bootcheck.sh

imx8qxp-mek/bat-devicetree: not ok 12 bat-devicetree.sh
run 12 bat-devicetree.sh
devicetree contains 214 devices, 37 disabled
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cluster-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/idle-states/cpu-sleep compat arm,idle-state
accept unbound /sys/firmware/devicetree/base/cpus/l2-cache0
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/audio_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/caam_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/cm40_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/connectivity_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/dc0_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/dma_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/gpu-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/hsio-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/imaging_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/lsio_power_domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/imx8qx-pm/vpu-power-domain compat nxp,imx8-pd
accept unbound /sys/firmware/devicetree/base/interrupt-controller@51a00000
accept unbound /sys/firmware/devicetree/base/reserved-memory/linux,cma
unbound device node /sys/firmware/devicetree/base/reserved-memory/rpmsg_dma@0x90400000 compatible: shared-dma-pool
unbound device node /sys/firmware/devicetree/base/vpu_encoder@2d000000/core0@1020000 compatible: fsl,imx8-mu1-vpu-m0
accept unbound /sys/firmware/devicetree/base/wu compat fsl,imx8-wu
Found 2 unbound devices
not ok 12 bat-devicetree.sh

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
